require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
    @order = orders(:one)
    @email = User.new(email: 'testuser@tennis.com')
  end

  test "Orders sucessfully processed and cart gets updated" do
    if @email === true
      assets_difference('Order.count', 1) do
        get orders_order_url, params: { order: { orderId: order.orderId, userEmail: order.userEmail, productsList: order.productsList, shippingAddress: order.shippingAddress, orderDate: orderDate}}
        assert_response :success
      end
    end
  end


  test "should view cart deatils" do
    get orders_viewcart_url
    assert_response :success
  end

  test "Should add products to cart" do
    if @email === true
      assert_difference('Cart.count') do
        get orders_cart_url, params: { cart: { casrtId: @cart.cartId, email: @cart.email, productId: @cart.productId, quantity: @cart.quantity, price: @cart.price, purchaseStatus: @cart.purchaseStatus, user: @cart.user_id, product: @cart.product_id}} 
        assert_response :success
      end
      assert_redirected_to products_url
    end
  end


  test "delete from cart if user doesn't want " do
    if @email === true
      assert_difference('Cart.count') do
        get orders_updatecart_url(@cart)
      end
      assert_response :success
    end
  end

  



end
