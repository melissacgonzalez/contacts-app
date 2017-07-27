class DeleteUserIdFromContactGroup < ActiveRecord::Migration[5.1]
  def change
    remove_column :contact_groups, :user_id, :integer
  end
end
