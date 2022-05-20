class ShiftsController < ApplicationController
    def index
        @shift = Shift.where(user_id: session[:user_id])
        @user = User.find_by(id: session[:user_id])
        
        @shift.each do |shift|
            shift[:hours_worked] = TimeDifference.between(shift.start, shift.finish).in_minutes
        end
    end
end