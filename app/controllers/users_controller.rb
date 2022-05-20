class UsersController < ApplicationController
    def update
        @user = User.find_by(id: session[:user_id])
        @user.organisation_id = params[:id]
        @user.save
        redirect_to root_path
    end
    def delete
        user = User.find_by(id: session[:user_id])
        user.organisation_id = nil
        if user.save
          redirect_to root_path
        else
            render json: {message: "nope"}
        end
    end
end