class RenameChatsIdAndUsersIdInMessages < ActiveRecord::Migration[8.0]
  def change
    remove_column :messages, :chats_id, :integer
    remove_column :messages, :users_id, :integer
  end
end
