class OrganisationsController < ApplicationController
    def index
    end

    def create
        user = User.find_by(id: session[:user_id])
        @organisation = Organisation.new(
            name: params[:name],
            hourly_rate: params[:hourly_rate]
        )
        if @organisation.save
            user.organisation_id = @organisation.id
            if user.save
              redirect_to root_path
            else
                render json: {message: "nope"}
            end
        else
            render json: {message: "nope"}
        end
    end

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