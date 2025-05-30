class  MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update, :destroy]

    def index
          @messages = Message.includes(:chat, :user).where(user_id: current_user.id).order(created_at: :desc)
    end
    def show
        @user = @message.user
        @chat = @message.chat
    end 
    def new
        @message = Message.new
    end
    def create
        @chat = Chat.find(params[:chat_id])
        @message = @chat.messages.build(message_params)
        @message.user = current_user

        if @message.save
            redirect_to chat_path(@chat), notice: 'Message sent successfully.'
        else
            flash.now[:alert] = @message.errors.full_messages.join(', ')
            render :new, status: :unprocessable_entity
        end
    end


    def edit

    end

    def update
        if @message.update message_params
            flash[:notice] = 'Message updated successfully.'
            redirect_to chat_path(@message.chat_id)
        else
            flash[:alert] = "#{@message.errors.full_messages.join(", ")}"
            redirect_to edit_message_path(@message.chat_id)
        end
    end

    def destroy
        if @message.destroy
            redirect_to chat_path(@message.chat_id), notice: "Message was successfully deleted."
        else
            redirect_to chat_path(@message.chat_id), alert: "Something went wrong. Please try again."
        end
    end


    private

    def set_message
        @message = Message.find(params[:id])
    end

    def message_params
        params.require(:message).permit(:chat_id, :user_id, :body)
    end
end