class CreateBoardGamesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :board_games_users do |t|
      t.integer :user_id
      t.integer :board_game_id
    end
  end
end
