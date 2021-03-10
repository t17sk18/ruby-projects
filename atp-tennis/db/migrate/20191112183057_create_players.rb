class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :playerId
      t.string :name
      t.string :hand
      t.string :country
      t.string :birthday
      t.references :isocode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
