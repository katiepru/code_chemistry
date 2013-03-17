class AddUserIdToProject < ActiveRecord::Migration
  def up
    add_column :projects, :user_id, :integer
    drop_table :users_projects
  end
  def down
    create_table :users_projects, :id => false do |t|
      t.references :project
      t.references :user
    end
    add_index :users_projects, [:project_id, :user_id]
    add_index :users_projects, [:user_id, :project_id]
    remove_column :projects, :user_id
  end
end
