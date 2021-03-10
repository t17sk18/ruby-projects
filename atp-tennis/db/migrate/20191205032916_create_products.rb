class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :productId
      t.string :productName
      t.string :productDescription
      t.float :productPrice
      t.string :productColor
      t.string :productSize
      t.integer :productAvailability
      t.text :productImage

      t.timestamps
    end
  end
end
