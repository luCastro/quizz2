class ReviewsController < ApplicationController
    before_action :authenticate_use!
    before_action :authorize_use!, only: [:destroy]

    def create

        @idea = Idea.find params[:idea_id]
        @review = Review.new review_params
        @review.idea = @idea
        @review.use = current_use

        if @review.save
            redirect_to idea_path(@idea)
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render "ideas/show"
        end

    end

    def destroy

        @review ||= Review.find params[:id]
        @review.destroy
        redirect_to idea_path(@review.idea)

    end

    private
    def review_params
        params.require(:review).permit(:body)
    end

    def authorize_use!
        @review = Review.find params[:id]
    
        unless can?(:crud, @review)
          flash[:danger] = "Access Denied!"
          redirect_to question_path(@review.idea)
        end
    end
end



