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


end
