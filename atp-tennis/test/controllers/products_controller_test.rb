require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @email = User.new(email: 'testuser@tennis.com')
  end

  test "should get index" do
    if @email === true 
      get products_url
      assert_response :success
    end  
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count', 1) do
      post products_url, params: { product: { productAvailability: @product.productAvailability, productColor: @product.productColor, productDescription: @product.productDescription, productId: @product.productId, productImage: @product.productImage, productName: @product.productName, productPrice: @product.productPrice, productSize: @product.productSize } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    if @email === true 
      get product_url(@product) 
      assert_response :success
    end
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { productAvailability: @product.productAvailability, productColor: @product.productColor, productDescription: @product.productDescription, productId: @product.productId, productImage: @product.productImage, productName: @product.productName, productPrice: @product.productPrice, productSize: @product.productSize } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    if @email === true 
      assert_difference('Product.count', 0) do
        destroy product_url(@product)
      end

      assert_redirected_to products_url
    end
  end
end
