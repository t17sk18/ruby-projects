class CreateMatchstats < ActiveRecord::Migration[6.0]
  def change
    create_table :matchstats do |t|
      t.integer :statId
      t.string :matchId
      t.string :playerId
      t.integer :points
      t.integer :rank
      t.boolean :winner
      t.integer :sets
      t.integer :set1
      t.integer :set2
      t.integer :set3
      t.integer :set4
      t.integer :set5
      t.float :avg_odds
      t.float :max_odds
      t.integer :total_pts
      t.integer :serve_pt
      t.integer :return_pt
      t.integer :aces
      t.integer :bp_saved
      t.integer :bp_faced
      t.integer :first_serve_rtn_won
      t.integer :second_serve_rtn_won
      t.integer :first_serve_in
      t.integer :dbl_faults
      t.float :first_server_per
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
