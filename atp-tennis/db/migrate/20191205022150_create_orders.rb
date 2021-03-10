class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :orderId
      t.string :userEmail
      t.string :productsList
      t.string :shippingAddress
      t.datetime :orderDate

      t.timestamps
    end
  end
end
