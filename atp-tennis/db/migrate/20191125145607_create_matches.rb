class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :matchId
      t.string :round
      t.string :date
      t.float :avg_min_game
      t.float :avg_seconds_point
      t.float :avg_minutes_set
      t.string :tournament
      t.integer :year
      t.integer :match_minutes

      t.timestamps
    end
  end
end
