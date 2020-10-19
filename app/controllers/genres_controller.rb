class GenresController < ApplicationController
    def index 
        @genres = Genre.all.order(:genre_name) 
    end
end
