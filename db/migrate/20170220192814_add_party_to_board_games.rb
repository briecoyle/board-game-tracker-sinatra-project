class AddPartyToBoardGames < ActiveRecord::Migration[5.0]
  def change
    add_column :board_games, :party, :boolean
  end
end
