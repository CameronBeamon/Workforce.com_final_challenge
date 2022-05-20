class UsersController < ApplicationController
    def update
        @user = User.find_by(id: session[:user_id])
        if @user.update_attribute(:organisation_id, params[:id])
          redirect_to root_path
        else 
            render json: {message: "user did not save"}
        end
    end
    def delete
        user = User.find_by(id: session[:user_id])
        if  user.update_attribute(:organisation_id, nil) && user.shifts.delete_all
          redirect_to root_path
        else
            render json: {message: "user did not save or shifts did not delete"}
        end
    end
end