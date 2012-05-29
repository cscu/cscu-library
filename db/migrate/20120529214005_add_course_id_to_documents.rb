class AddCourseIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :course_id, :integer
  end
end
