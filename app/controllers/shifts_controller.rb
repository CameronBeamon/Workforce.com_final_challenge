class ShiftsController < ApplicationController
    def index
        @shift = Shift.where(user_id: session[:user_id])
        @user = User.find_by(id: session[:user_id])
        @org = params[:org]
        @hourly_rate = params[:hourly_rate].to_i
    end
    def create
        @user = User.find_by(id: session[:user_id])
        start_time = DateTime.parse("#{params[:date]} #{params[:start]}")
        finish_time = DateTime.parse("#{params[:date]} #{params[:finish]}")
        @new_shift = Shift.new(
            user_id: @user.id,
            start: start_time,
            finish: finish_time,
            break_length: params[:break_length]
        )
        if @new_shift.save
            redirect_to view_shift_path
        else
            redirect_to root_path
        end
    end
end