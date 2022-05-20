class UsersController < ApplicationController
    def update
        @user = User.find_by(id: session[:user_id])
        # @user.organisation_id = params[:id]
        pp @user
        if @user.update_attribute(:organisation_id, params[:id])
          redirect_to root_path
        else 
            render json: {message: "user did not save"}
        end
    end
    def delete
        user = User.find_by(id: session[:user_id])
        user.organisation_id = nil
        if user.save
          redirect_to root_path
        else
            render json: {message: "user did not save"}
        end
    end
end