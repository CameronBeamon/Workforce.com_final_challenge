class HomeController < ApplicationController
    def index
        if  !session[:user_id]
            redirect_to login_path
        elsif session[:user_id]
          @user = User.find_by(id: session[:user_id])
          @organisation = Organisation.all
        end
    end
end