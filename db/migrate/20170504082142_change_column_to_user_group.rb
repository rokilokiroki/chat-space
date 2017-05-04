class ChangeColumnToUserGroup < ActiveRecord::Migration[5.0]
  def change
    change_column :user_groups, :user_id, :integer, null: false, foreign_key: true
    change_column :user_groups, :group_id, :integer, null: false, foreign_key: true
  end
end
