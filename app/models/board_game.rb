class BoardGame < ActiveRecord::Base
  has_many :users_board_games
  has_many :users, through: :users_board_games
end
