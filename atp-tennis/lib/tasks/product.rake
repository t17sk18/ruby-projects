namespace :product do
  desc "TODO"
  task seed_product: :environment do
    Cart.destroy_all
    Product.destroy_all
    CSV.foreach("lib/assets/product.csv", :headers => true) do |row|
      puts row.inspect
      Product.create!(
      productId: row[0],
      productName: row[1],
      productDescription: row[2],
      productPrice: row[3],
      productColor: row[4],
      productSize: row[5],
      productAvailability: row[6],
      productImage: row[7]
      )
    end
  end
end


