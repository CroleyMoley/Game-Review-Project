class SessionsController < ApplicationController

    def welcome
        
    end

    def new 
    end

    def create
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user 
    end

end
