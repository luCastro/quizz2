class UsesController < ApplicationController

    def new
        @use = Use.new 
    end

    def create
        @use = Use.new use_params
    
        if @use.save
          session[:use_id] = @use.id
    
          redirect_to ideas_path
        else
          render :new
        end
    end
    
    private
    def use_params
    params.require(:use).permit(
        :first_name, :last_name, :email, :password, :password_confirmation
    )
    end
      
end
