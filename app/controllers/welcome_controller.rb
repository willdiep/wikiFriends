class WelcomeController < ApplicationController

    def home
        if current_user
            redirect_to "/users/#{current_user.id}"
        end
    end

end
