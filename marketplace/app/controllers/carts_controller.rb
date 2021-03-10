class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @subtotal =  current_order.subtotal
      
    quantity = 0
    @order_items.each do |item|
      if item.product_id == 1
        @orderid = item.order_id
        @productCode = item.product_id
        quantity = quantity + item.quantity;
      end
    end
   # Promotional Offer: Product 001 price drops to 8.50 pounds       
    if quantity >= 2
      actualProductValue = quantity * 9.25
      offerProductValue = quantity * 8.50
      productFinalValue = actualProductValue - offerProductValue
      @subtotal = @subtotal - productFinalValue
    else
      productFinalValue = 0
    end
   # Promotional Offer 10% for the value more than 60 pounds
    if @subtotal >= 60
      @totalValueAfterOffer = (@subtotal - (@subtotal * 0.1)).round(2)
    else
      @totalValueAfterOffer = @subtotal
    end
   # updating DB total for this session
      Order.where(id: @orderid).update(total: @totalValueAfterOffer)
   

  end
end
