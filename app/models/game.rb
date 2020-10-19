class Game < ApplicationRecord
    belongs_to :genre
    belongs_to :user
    has_many :reviews 
    has_many :users, through: :reviews
    accepts_nested_attributes_for :genre
    validates :game_name, uniqueness: true, presence: true

    def game_name_and_genre
        "#{game_name} - #{genre.genre_name}"
    end

end
