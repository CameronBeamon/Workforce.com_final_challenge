class OrganisationsController < ApplicationController
    def index
    end

    def create
        @organisation = Organisation.new(
            name: params[:name],
            hourly_rate: params[:hourly_rate]
        )
        if @organisation.save
            redirect_to root_path
        end
    end

    def delete
        @user = User.find_by(id: session[:user_id])
        @user.organisation_id = nil
    end
end