class ReviewsController < ApplicationController
    def new
        if @game = Game.find_by_id(params[:game_id])
        @review = @game.reviews.build
        else
            @review = Review.build
        end
    end

    def index

    end

    def create 
        Review.create(review_params)
        redirect_to review_path(@review)
    end

    def show 
        @review = Review.find_by_id(params[:id])
    end

    private
    def review_params
        params.require(:review).permit(:game_id, :content, rating, :title)
    end


end
