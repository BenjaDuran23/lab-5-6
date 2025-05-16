class  MessagesController < ApplicationController
    before_action :set_message, only: [:show, :edit, :update]

    def index
        @messages = Message.all
    end
    def show
        @user = @message.user
        @chat = @message.chat
    end 
    def new
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to @message, notice: 'Message was successfully created.'
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @message.update message_params
            flash[:notice] = 'Message updated successfully.'
            redirect_to @message
        else
            flash[:alert] = "#{@message.errors.full_messages.join(", ")}"
            redirect_to edit_message_path(@message)
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