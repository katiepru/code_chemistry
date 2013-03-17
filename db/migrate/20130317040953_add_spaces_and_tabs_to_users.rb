class AddSpacesAndTabsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spaces, :integer
    add_column :users, :tabs, :integer
  end
end
