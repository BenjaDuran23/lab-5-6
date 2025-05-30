class User < ApplicationRecord 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :messages, dependent: :destroy
    validates :email, presence: true,  uniqueness: true
    def to_s
        "#{first_name} #{last_name}"
    end

    def all_chats
      Chat.where("sender_id = ? OR receiver_id = ?", id, id)
    end
end