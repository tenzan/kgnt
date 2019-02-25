class SessionsController < ApplicationController
    def new
    end

     def create
        if user = User.authenticate(params[:email],params[:password])
            session[:user_id] = user.id
            flash[:notice] = "Signed in successfully."
            redirect_to user
        else
            flash.now[:alert] = 'Invalid email or password!'
            render :new
        end
    end
end