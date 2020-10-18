class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :title, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 11}
  validates :content, presence: true
end
