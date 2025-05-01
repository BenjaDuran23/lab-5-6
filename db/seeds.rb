# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(email: "user1@gmail.com" ,first_name: "user1",last_name: "lastname_user1")
User.create(email: "user2@gmail.com" ,first_name: "user2",last_name: "lastname_user2")
User.create(email: "user3@gmail.com" ,first_name: "user3",last_name: "lastname_user3")
User.create(email: "user4@gmail.com" ,first_name: "user4",last_name: "lastname_user4")
User.create(email: "user5@gmail.com" ,first_name: "user5",last_name: "lastname_user5")
User.create(email: "user6@gmail.com" ,first_name: "user6",last_name: "lastname_user6")
User.create(email: "user7@gmail.com" ,first_name: "user7",last_name: "lastname_user7")
User.create(email: "user8@gmail.com" ,first_name: "user8",last_name: "lastname_user8")
User.create(email: "user9@gmail.com" ,first_name: "user9",last_name: "lastname_user9")
User.create(email: "user10@gmail.com" ,first_name: "user10",last_name: "lastname_user10")

Chat.create(sender_id: 1,receiver_id: 2)
Chat.create(sender_id: 2,receiver_id: 3)
Chat.create(sender_id: 3,receiver_id: 4)
Chat.create(sender_id: 4,receiver_id: 5)
Chat.create(sender_id: 5,receiver_id: 6)
Chat.create(sender_id: 6,receiver_id: 7)
Chat.create(sender_id: 7,receiver_id: 8)
Chat.create(sender_id: 8,receiver_id: 9)
Chat.create(sender_id: 9,receiver_id: 10)
Chat.create(sender_id: 10,receiver_id: 1)

Message.create(chat_id: 1,user_id: 2,body: "Hello, how are you?")
Message.create(chat_id: 2,user_id: 3,body: "Hello, how are you?")
Message.create(chat_id: 3,user_id: 4,body: "Hello, how are you?")
Message.create(chat_id: 4,user_id: 5,body: "Hello, how are you?")
Message.create(chat_id: 5,user_id: 6,body: "Hello, how are you?")
Message.create(chat_id: 6,user_id: 7,body: "Hello, how are you?")
Message.create(chat_id: 7,user_id: 8,body: "Hello, how are you?")
Message.create(chat_id: 8,user_id: 9,body: "Hello, how are you?")
Message.create(chat_id: 9,user_id: 10,body: "Hello, how are you?")
Message.create(chat_id: 10,user_id: 1,body: "Hello, how are you?")