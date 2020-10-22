class SessionsController < ApplicationController

    def welcome
        
    end

    def new 
    end

    def create
       @user = User.find_by(username: params[:user][:username])
        
       if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
       else
        flash[:error] = "Incorrect, please try again."
        redirect_to login_path
       end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
        session[:user_id] = @user.id
    end

    private

        def auth
            request.env['omniauth.auth']
        end

end
