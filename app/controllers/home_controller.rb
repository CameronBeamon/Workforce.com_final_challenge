class HomeController < ApplicationController
    def initialize
        # if  !session[:user_id]
        #     redirect_to login_path
        # end
        if session[:user_id]
          @user = User.find_by(id: session[:user_id])
        end
    end
end