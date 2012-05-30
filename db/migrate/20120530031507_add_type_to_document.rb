class AddTypeToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :category, :string
  end
  def self.down
    remove_column :documents, :category
  end
end
