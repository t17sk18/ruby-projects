
# this controller for admin dashboard

class InformationController < ApplicationController
  
  before_action :authenticate_user!
  def index

    if current_user.admin == false
      redirect_to root_path
    else 
      @users = User.all
      @orders = Order.all
      @products = Product.all
      @cart = Cart.all
      @product = []
      @totalSaleQuantity = []
      @totalSales = []

      @products.each do |product|
      
        totalSaleQuantity = 0
        totalSales = 0.0
        @cart.each do |cart|
        
          if product.productId == cart.productId && cart.purchaseStatus == TRUE
            
            totalSaleQuantity = totalSaleQuantity + cart.quantity
            totalSales = totalSales + cart.price

          end
          puts totalSaleQuantity
          @product << product.productName
          @totalSaleQuantity << totalSaleQuantity
          @totalSales << totalSales
        end    
      end
    end
  end
end
