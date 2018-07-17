class SessionsController < ApplicationController

    def new
    end

    def create
        use = Use.find_by(email: params[:session][:email])

        if use&.authenticate(params[:session][:password])
            session[:use_id] = use.id

            flash[:success] = "Hi, #{use.first_name}!"
            redirect_to ideas_path
        else
            flash[:danger] = "Invalid email or password"
            redirect_to new_session_path
        end
    end
    
    def destroy
        session[:use_id] = nil

        redirect_to ideas_path
    end
end
