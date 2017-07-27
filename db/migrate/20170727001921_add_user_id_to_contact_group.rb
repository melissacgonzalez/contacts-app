class AddUserIdToContactGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_groups, :user_id, :integer
  end
end
