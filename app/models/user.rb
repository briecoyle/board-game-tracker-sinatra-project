class User < ActiveRecord::Base
  has_many :user_board_games
  has_many :board_games, through: :users_board_games

  has_secure_password
  validate :username
end
