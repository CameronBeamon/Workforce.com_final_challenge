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
end