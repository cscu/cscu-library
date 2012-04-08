class AddFieldsToCourses < ActiveRecord::Migration
  def self.up
    remove_column :courses, :code
    add_column :courses, :subject, :string
    add_column :courses, :number, :string

    add_index :courses, :subject
    add_index :courses, :number
    add_index :courses, [:subject, :number], :unique => true
  end

  def self.down
    remove_column :courses, :subject
    remove_column :courses, :number
    add_column :courses, :code, :string
  end
end
