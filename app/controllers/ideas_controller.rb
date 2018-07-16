class IdeasController < ApplicationController
    
    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new ideas_params

        if @idea.save
            redirect_to idea_path(@idea.id)
        else
            render :new
        end
    end


    def show
        find_idea
    end



    private 
    def ideas_params
        params.require(:idea).permit(:title, :description) 
    end

    def find_idea
        @idea = Idea.find params[:id]
    end
end
