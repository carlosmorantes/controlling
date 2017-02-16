class RemovePermissionLevelFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :permission_level, :string
  end
end
