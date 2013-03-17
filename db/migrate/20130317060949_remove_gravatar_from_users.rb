class RemoveGravatarFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :gravatar
  end

  def down
    add_column :users, :gravatar, :string
  end
end
