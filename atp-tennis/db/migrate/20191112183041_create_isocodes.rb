class CreateIsocodes < ActiveRecord::Migration[6.0]
  def change
    create_table :isocodes do |t|
      t.string :isocode
      t.string :country

      t.timestamps
    end
  end
end
