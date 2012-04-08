class Course < ActiveRecord::Base
  has_many :prerequisite_relationships, :foreign_key => "prereq_for_id",
                                        :class_name => "Prerequisite",
                                        :dependent => :destroy
  has_many :prerequisites, :through => :prerequisite_relationships, :source => :prereq

  def add_prerequisite!(course)
    prerequisite_relationships.create!(:prereq_id => course.id)
  end

  def remove_prerequisite!(course)
    prerequisite_relationships.find_by_prereq_id(course).destroy
  end

  def has_prerequisite?(course)
    prerequisite_relationships.find_by_prereq_id(course)
  end

  def Course.split_code(code)
    code.upcase!
    parts = code.match(/^([A-Z]+)(.+)/)
    if parts
      return [parts[1], parts[2]]
    end
  end

  def code
    unless subject.nil? or number.nil?
      "#{subject.upcase}#{number}"
    end
  end

  def code=(c)
    parts = Course.split_code(c)
    if parts
      self.subject = parts[0]
      self.number = parts[1]
    end
  end

  def Course.find_by_code(c)
    parts = split_code(c)
    if parts
      return Course.where(:subject => parts[0], :number => parts[1]).first
    end
  end

  def Course.create_from_ryerson_calendar(calendar)
    courses = parse_ryerson_calendar(calendar)
    courses.each do |c| 
      if existing = find_by_code("#{c[:subject]}#{c[:number]}")
        existing.update_attributes(:name => c[:name], :description => c[:description])
      else
        create!(:name => c[:name], :subject => c[:subject], :number => c[:number], :description => c[:description])
      end
    end
    courses.each do |c|
      course = find_by_code("#{c[:subject]}#{c[:number]}")
      c[:prereqs].each do |p|
        puts "ADDING PREREQ #{p} TO #{course.code}"
        if prereq = find_by_code(p)
        puts "SAVING PREREQ #{p} TO #{course.code}"
          course.add_prerequisite!(prereq) unless course.has_prerequisite?(prereq)
        end
      end
    end
  end

  def Course.parse_ryerson_calendar(calendar)
    courses = []
    divs = calendar.xpath('//div/a').select{|a| a.to_s =~ /\d+/}.collect{|a| a.parent}
    divs.each do |div|
      header = div.xpath("table/tr/td//span//span").map{|s| s.text}
      c = {
        :subject => header[0],
        :number => header[1],
        :name => header[2]
      }
      div.xpath("table/tr/td/span").each do |content|
        id = content.attr 'id'
        text = content.text
        case id
        when /CourseDescription/
          c[:description] = text
        when /CourseAttribute/
          c[:attributes] = text
        when /Components/
          c[:components] = text
        when /CoursePrereq/
          c[:prereqs] = []
          content.xpath("a").each{|a| c[:prereqs] << a.text.gsub(' ','')}
        when /Consent/
          c[:consent] = text
        when /CourseWeight/
          c[:weight] = text.match(/(\d+.?\d*)/)[1]
        when /BillingUnits/
          c[:billing_units] = text.match(/(\d+.?\d*)/)[1]
        end
      end
      courses << c
    end
    courses
  end
end
