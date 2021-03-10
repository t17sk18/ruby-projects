class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :cartId
      t.string :email
      t.integer :productId
      t.integer :quantity
      t.float :price
      t.boolean :purchaseStatus
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
