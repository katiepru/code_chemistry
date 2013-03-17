class ChangeProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :url
  end

  def down
    add_column :projects, :url, :string
  end
end
