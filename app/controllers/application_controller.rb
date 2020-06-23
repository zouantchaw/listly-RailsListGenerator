class ApplicationController < ActionController::Base

    def welcome 
        @current_user = current_user
    end 
end
