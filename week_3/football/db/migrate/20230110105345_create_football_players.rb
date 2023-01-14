class CreateFootballPlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :football_players do |t|
      t.string :name
      t.integer :rank
      t.string :country
      t.string :position
      t.string :squad
      t.string :league
      t.integer :age
      t.integer :born
      t.integer :minutes_played
      t.integer :goals
      t.integer :penalty_kicks_made
      t.integer :matches_played
      t.integer :corner_kicks
      t.integer :yellow_card
      t.integer :red_card
      t.integer :penalty_kicks_won
      t.integer :fouls_committed

      t.timestamps
    end
  end
end
