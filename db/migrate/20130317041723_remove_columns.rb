class RemoveColumns < ActiveRecord::Migration
  def up
    remove_column :users, :tabs
    remove_column :users, :spaces
    add_column :users, :indent, :integer
  end

  def down
    remove_column :users, :indent
    add_column :users, :tabs, :integer
    add_column :users, :spaces, :integer
  end
end
