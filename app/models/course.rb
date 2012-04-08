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
end
