class CreatePrerequisites < ActiveRecord::Migration
  def self.up
    create_table :prerequisites do |t|
      t.integer :prereq_for_id
      t.integer :prereq_id
      t.timestamps
    end
    add_index :prerequisites, :prereq_for_id
    add_index :prerequisites, :prereq_id
    add_index :prerequisites, [:prereq_for_id, :prereq_id], :unique => true
  end

  def self.down
    drop_table :prerequisites
  end
end
