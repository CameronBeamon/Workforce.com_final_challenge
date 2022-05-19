class HomeController < ApplicationController
    def initialize
        if !current_user
            redirect_to login_path
        end
    end
end