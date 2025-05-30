class ChatsController < ApplicationController
    before_action :set_chat, only: [:show, :edit, :update, :destroy]

    def index
        @chats = Chat.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id).includes(:sender, :receiver).order(created_at: :desc)
    end
    def show
        @messages = @chat.messages.includes(:user)
    end 
    def new
        @chat = Chat.new
    end
    def create
        sender_id = current_user.id
        receiver_id = params[:chat][:receiver_id].to_i

        if sender_id == receiver_id
            flash.now[:alert] = "You can't chat with yourself."
            @chat = Chat.new
            render :new and return
        end

        
        existing_chat = Chat.where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)",sender_id, receiver_id, receiver_id, sender_id).first

        if existing_chat
            redirect_to chat_path(existing_chat), notice: "Chat already exists."
        else
            @chat = Chat.new(sender_id: sender_id, receiver_id: receiver_id)
            if @chat.save
                redirect_to chat_path(@chat), notice: "Chat created successfully."
            else
                flash.now[:alert] = @chat.errors.full_messages.to_sentence
                render :new
            end
        end
    end

    def edit
       
    end

    def update
        if @chat.update chat_params
            flash[:notice] =  'Chat updated successfully.'
            redirect_to @chat
        else
            flash[:alert] = "#{@chat.errors.full_messages.join(", ")}"
            redirect_to edit_chat_path(@chat)
        end
    end

    def destroy
        if @chat.destroy
            redirect_to chats_path, notice: "Chat was successfully deleted."
        else
            redirect_to chats_path, alert: "Failed to delete the chat."
    end
    end

    private

    def set_chat
        @chat = Chat.find(params[:id])
    end

    def chat_params
        params.require(:chat).permit(:sender_id, :receiver_id)
    end
end