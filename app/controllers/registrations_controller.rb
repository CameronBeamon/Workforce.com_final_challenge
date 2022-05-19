class RegistrationsController < ApplicationController
    def new
    end
    def create
        @user = User.new(
            name: params[:name],
            email_address: params[:email_address],
            password: params[:password],
            password_confirmation: params[:password_confirmation],
          )
          if @user.save
            # render json: { message: "User created successfully" }, status: :created
            session[:user_id] = @user.id
            redirect_to root_path, status: 200
          else
            render json: { errors: @user.errors.full_messages }, status: :bad_request
          end  
    end
end