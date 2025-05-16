class  UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    def index
        @users = User.all
    end
    def show
        @chat_ids = @user.all_chats.pluck(:id)
        @messages = @user.messages 
    end 
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: 'User was successfully created.'
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @user.update user_params
            flash[:notice] = 'User was successfully updated.'
            redirect_to @user
        else
            flash[:alert] = "#{@user.errors.full_messages.join(", ")}"
            redirect_to edit_user_path(@user)
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email)
    end

end