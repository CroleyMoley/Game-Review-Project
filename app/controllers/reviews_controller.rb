class ReviewsController < ApplicationController
    def new
        if @game = Game.find_by_id(params[:game_id])
        @review = @game.reviews.build
        else
            @review = Review.build
        end
    end

    def index
        if @game = Game.find_by_id(params[:game_id])
            @reviews = Game.reviews
        else
            @reviews = Review.all 
        end
    end

    def create 
        @review = Review.create(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show 
        @review = Review.find_by_id(params[:id])
    end

    private
    def review_params
        params.require(:review).permit(:game_id, :content, :rating, :title)
    end


end
