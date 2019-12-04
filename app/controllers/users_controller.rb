class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:create, :new]
    
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to 'new'
        end 
    end

    def destroy
        User.find(params[:id]).destroy
        session[:user_id] = nil
        redirect_to "/"
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
