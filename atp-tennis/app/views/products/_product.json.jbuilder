json.extract! product, :id, :productId, :productName, :productDescription, :productPrice, :productColor, :productSize, :productAvailability, :productImage, :created_at, :updated_at
json.url product_url(product, format: :json)
