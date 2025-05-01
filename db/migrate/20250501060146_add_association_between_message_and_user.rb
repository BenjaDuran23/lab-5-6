class AddAssociationBetweenMessageAndUser < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :messages, :users, column: :user_id
  end
end
