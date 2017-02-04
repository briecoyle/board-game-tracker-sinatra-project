class User < ActiveRecord::Base
  has_many :users_board_games
  has_many :board_games, through: :users_board_games

  has_secure_password
  validates_uniqueness_of :username
end
