class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @user = User.find(session[:user_id]) || User.new
    end
end
