class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email_address: params[:email_address])
    if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to root_path
    end
  end
  
  def delete
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end
end