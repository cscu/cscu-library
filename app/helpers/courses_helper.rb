module CoursesHelper
  def sort_by_year(documents)
    documents.sort do |a,b|
      if a.year.nil? then
        1
      elsif b.year.nil? then
        -1
      else
        b.year <=> a.year
      end
    end
  end
end
