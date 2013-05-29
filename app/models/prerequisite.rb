class Prerequisite < ActiveRecord::Base
  attr_accessible :prereq_for_id, :prereq_id
  belongs_to :prereq_for, :class_name => "Course"
  belongs_to :prereq, :class_name => "Course"

  validates :prereq_for, :presence => true
  validates :prereq, :presence => true
end
