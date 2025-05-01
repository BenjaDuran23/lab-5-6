class User < ApplicationRecord 
    has_many :messages
    validates :email, presence: true,  uniqueness: true
    def to_s
        "#{first_name} #{last_name}"
      end
end