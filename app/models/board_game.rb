class BoardGame < ActiveRecord::Base
  has_many :user_board_games
  has_many :users, through: :users_board_games
end
