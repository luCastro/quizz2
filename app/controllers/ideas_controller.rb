class IdeasController < ApplicationController
    before_action :authenticate_use!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_idea, only: [:show, :edit, :update, :destroy]
    before_action :authorize_use!, only: [:edit, :update, :destroy]

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new ideas_params
        @idea.use = current_use

        if @idea.save
            redirect_to idea_path(@idea.id)
        else
            render :new
        end
    end

    def show
        @review = Review.new
        @reviews = @idea.reviews.order(created_at: :desc)
        render :show
    end

    def index
        @ideas = Idea.order(created_at: :desc)   
    end

    def edit
    end

    def update
        if @idea.update(ideas_params)
            redirect_to idea_path(@idea.id)
        else
        render :edit
        end 
    end

    def destroy
        @idea.destroy
        redirect_to ideas_path
    end

    private 
    def ideas_params
        params.require(:idea).permit(:title, :description) 
    end

    def find_idea
        @idea = Idea.find params[:id]
    end

    def authorize_use!
        unless can?(:crud, @idea)
          flash[:danger] = "Access Denied"
          redirect_to idea_path(@idea)
        end
    end

end





