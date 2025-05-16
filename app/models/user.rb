class User < ApplicationRecord 
    has_many :messages
    validates :email, presence: true,  uniqueness: true
    def to_s
        "#{first_name} #{last_name}"
    end

    def all_chats
      Chat.where("sender_id = ? OR receiver_id = ?", id, id)
    end
end