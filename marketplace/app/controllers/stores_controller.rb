class StoresController < ApplicationController
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @order_items = current_order.order_items
  end

  def show
    @product = Product.find(params[:id])
  end
end
