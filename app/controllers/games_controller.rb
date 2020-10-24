class GamesController < ApplicationController
    def new 
        @game = Game.new
        @game.build_genre
    end
    def create
       @game = Game.new(game_params)
       @game.user_id = session[:user_id]
       if @game.save
        redirect_to game_path(@game)
       else
        render :new 
       end 
    end

    def index 
        @games = Game.all.order(:game_name) 
    end

    def show 
        @reviews = Review.find_by(id: params[:id])
        @game = Game.find_by_id(params[:id])     
    end

    private
    def game_params
        params.require(:game).permit(:game_name, :genre_id, genre_attributes: [:genre_name])
    end
end
