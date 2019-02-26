class SessionsController < ApplicationController
    def new
    end

     def create
        if user = User.authenticate(params[:session][:email], params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Signed in successfully."
            redirect_to user
        else
            flash.now[:alert] = 'Invalid email or password!'
            render :new
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Signed out successfully."
    end
end