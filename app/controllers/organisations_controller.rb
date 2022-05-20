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
        organisation = Organisation.find_by(id: params[:id])
        organisation.name = params[:name] || organisation.name
        organisation.hourly_rate = params[:hourly_rate] || organisation.hourly_rate
        if organisation.save
            redirect_to root_path
        else
            render json: {message: "nope"}
        end
    end

    def delete
    #   user = User.find_by(id: session[:user_id])
    #   @organisation = Organisation.find_by(id: params[:id])
    #   @organisation.destroy
    #   user.organisation_id = nil
    #   redirect_to root_path
    end
end