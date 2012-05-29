class Document < ActiveRecord::Base
  belongs_to :course
  has_attached_file :file
end
