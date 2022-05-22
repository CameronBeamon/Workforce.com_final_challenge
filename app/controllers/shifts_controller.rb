class ShiftsController < ApplicationController
    def index
        @user_all_shifts = []
        @shift = Shift.where(user_id: session[:user_id])
        @user = User.find_by(id: session[:user_id])
        @user_all = User.where(organisation_id: @user.organisation.id)
        @org = @user.organisation
        @hourly_rate = @user.organisation.hourly_rate

        @user_all.each do |user|
            if user != @user
              @user_all_shifts << Shift.find_by(user_id: user.id)
            end
        end
    end
    def edit
        @shift = Shift.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
    end
    def update
        @shift = Shift.find_by(id: params[:id])
        if params[:date] && params[:start] == true
          start_time = DateTime.parse("#{params[:date]} #{params[:start]}")
        elsif params[:date] && params[:finish] == true
          finish_time = DateTime.parse("#{params[:date]} #{params[:finish]}")
        end
        @shift.start = start_time || @shift.start
        @shift.finish = finish_time || @shift.finish
        @shift.break_length = params[:break_length] || @shift.break_length
        if @shift.save
            redirect_to view_shift_path
        else
            render json: {message: "shift did not save"}
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
    def delete
        shift = Shift.find_by(id: params[:id])
        if shift.destroy
            redirect_to view_shift_path
        else
            render json: {message: "shift did not destroy"}
        end
    end
end