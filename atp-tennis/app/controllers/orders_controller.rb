class OrdersController < ApplicationController
  
  before_action :authenticate_user!
  
  def cart
    if user_signed_in?
      @loggedUser = current_user.email
      userIdReference = current_user.id
    else
      # for Guest cart and Checkout
      @loggedUser = "guest@tennis.com" 
      user = User.where(email: @loggedUser)
    
      user.each do |u|
        userIdReference = u.id
      end
    end
      
    quantity = params[:quantity].to_i
    productAddedToCart = params[:productSelected]
      
    @products = Product.all
    @selectedProduct = Product.where(productId: productAddedToCart)
    productIdReference = Product.find_by(productId: productAddedToCart).id

        @selectedProduct.each do |productDetails|
        # puts productDetails.productName
        totalPrice = productDetails.productPrice * quantity
               
        if Cart.count == 0
          cartCount = 0
        else
          cartCount = Cart.last.cartId
        end

        cart = Cart.new do |cartItems|
          cartItems.cartId = cartCount + 1
          cartItems.email = @loggedUser
          cartItems.productId = productAddedToCart
          cartItems.quantity = quantity
          cartItems.price = totalPrice
          cartItems.purchaseStatus = FALSE
          cartItems.user_id = userIdReference
          cartItems.product_id = productIdReference
          cartItems.created_at = Time.now
          cartItems.updated_at = Time.now
        end
        cart.save
      end
      redirect_back fallback_location: @products
  end


  def viewcart
  
    if user_signed_in?
      @loggedUser = current_user.email
    else
      @loggedUser = "guest@tennis.com" 
      userIdReference = User.where(email: @loggedUser)
    end 
       
    @count = 0
    @totalcost = 0.0
    @cartid = []
    @itemName = []
    @itemDesciption =[]
    @image = []
    @itemQuantity = []
    @itemPrice = []
    @itemTotal = []

    @cart = Cart.all
    @cart.each do |cartDetails|
      if cartDetails.email == @loggedUser && cartDetails.purchaseStatus == FALSE
        @cartid << cartDetails.cartId
        @itemName << cartDetails.product.productName
        @itemDesciption << cartDetails.product.productDescription
        @image << cartDetails.product.productImage
        @itemQuantity << cartDetails.quantity
        @itemPrice << cartDetails.price
        @itemTotal << cartDetails.quantity * cartDetails.price
        @totalcost = @totalcost + cartDetails.price
        @message = "Please Checkout " 
        @count = @count + 1
      else
        @totalcost = 0.00
        @message = "Your Cart is Empty. Continue Shopping"
      end
    end
  end


  def updatecart
    if user_signed_in?
      @loggedUser = current_user.email
    else
      @loggedUser = "guest@tennis.com" 
      userIdReference = User.where(email: @loggedUser)
    end 
   
    id = params[:Item]
    itemToDelete = Cart.find_by(cartId: id)
    itemToDelete.destroy
    redirect_back fallback_location: orders_viewcart_url
   end

  def checkout
    if user_signed_in?
      @loggedUser = current_user.email
    else
      @loggedUser = "guest@tennis.com" 
      userIdReference = 0
    end 
   
      @totalcost = 0.00
      @cart = Cart.all
      @cart.each do |cartDetails|
      
        if cartDetails.email == @loggedUser && cartDetails.purchaseStatus == FALSE
        @totalcost = @totalcost + cartDetails.price
      else
        @totalcost = 0.00
        @message = "Your Cart is Empty. Continue Shopping"
      end
    end
  end

  def orders
    if user_signed_in?
      @loggedUser = current_user.email
    else
      @loggedUser = "guest@tennis.com"  
      userIdReference = User.where(email: @loggedUser)
    end 

 productsList = ""
    @cart = Cart.all
    @cart.each do |cartDetails|
      if cartDetails.email == @loggedUser && cartDetails.purchaseStatus == FALSE
        productsList = productsList + ", " + cartDetails.product.productName
      else
      end
    end

    @email = params[:email]
    if @email != ""
      @email = params[:email]
    else
      if user_signed_in?
        @email = current_user.email
      else
        @email = 'guest@tennis.com'
      end
    end
    p
    @fname = params[:firstname]
    @lname = params[:lastname]
    @address = params[:address]
    @contact = params[:contact]
    @num4 = params[:num4]

    if Order.count == 0
      count = 0
    else
      count = Order.last.orderId
    end
    
    order = Order.new do |o|
      o.orderId = count + 1
      o.userEmail = @email
      o.productsList = productsList
      o.shippingAddress = @address
      o.orderDate = Time.now
      o.created_at = Time.now
      o.updated_at = Time.now
    end
    order.save
    finishedOrders = Cart.where(email: @loggedUser, purchaseStatus: FALSE)
    finishedOrders.update_all(purchaseStatus: TRUE)
  end
end