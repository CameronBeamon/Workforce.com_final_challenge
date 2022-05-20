class ShiftsController < ApplicationController
    def index
        @user_all_shifts = []
        @shift = Shift.where(user_id: session[:user_id])
        @user = User.find_by(id: session[:user_id])
        @user_all = User.where(organisation_id: params[:id])
        @org = params[:org]
        @hourly_rate = params[:hourly_rate].to_i

        @user_all.each do |user|
            @user_all_shifts << Shift.find_by(user_id: user.id)
        end
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
            render json: {message: "Shift did not save"}
        end
    end
end