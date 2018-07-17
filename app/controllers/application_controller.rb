class ApplicationController < ActionController::Base

    private
    def current_use
        if session[:use_id].present?
        @current_use ||= Use.find_by(id: session[:use_id])
        end
    end

    helper_method(:current_use)

    def use_signed_in?
        @current_use.present?
    end

    helper_method :use_signed_in?

    def authenticate_use!
        unless current_use.present?
        flash[:danger] = "You must sign in or sign up first!"
        redirect_to new_session_path
        end
    end

end
