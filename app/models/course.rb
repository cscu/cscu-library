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
end
