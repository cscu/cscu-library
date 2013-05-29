class AddIndexToDocuments < ActiveRecord::Migration
  def self.up
    add_index :documents, :course_id, :name => 'index_documents_on_course'
  end

  def self.down
    remove_index :documents, 'index_document_on_course'
  end
end
