class CreateBoardGames < ActiveRecord::Migration[5.0]
  def change
    create_table :board_games do |t|
      t.string :name
      t.text :description
      t.integer :min_players
      t.integer :max_players
    end
  end
end
