class AddSemesterToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :year, :integer
    add_column :documents, :semester, :string
  end

  def self.down
    remove_column :documents, :year
    remove_column :documents, :semester
  end
end
