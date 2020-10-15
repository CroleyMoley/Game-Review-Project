class Game < ApplicationRecord
    belongs_to :genre
    belongs_to :user
    has_many :reviews 
    has_many :users, through: :reviews
    accepts_nested_attributes_for :genre
end
