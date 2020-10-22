class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_games, through: :reviews, source: :game
    has_many :games
    has_secure_password
    validates :username, uniqueness: true, presence: true 

    def self.create_by_google_oauth2(auth)
    self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
        end
    end
    
end
