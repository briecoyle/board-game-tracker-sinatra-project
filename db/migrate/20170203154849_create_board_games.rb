class CreateBoardGames < ActiveRecord::Migration[5.0]
  def change
    create_table :board_games do |t|
      t.string :name
      t.text :description
      t.integer :num_of_players
    end
  end
end
