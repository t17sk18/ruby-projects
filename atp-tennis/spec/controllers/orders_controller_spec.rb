require 'rails_helper'
require 'spec_helper'

# Instruction from: http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/
RSpec.describe OrdersController, type: :controller do
  describe "routing to Add product to Cart, view cart and checkout to add orders" do
    it "routes /orders/cart to orders#cart" do
      expect(get: "/orders/cart").to route_to(
        controller: "orders",
        action: "cart"
      )
    end

    it "routes to check View the cart" do
      expect(get: "/orders/viewcart").to route_to(
        controller: "orders",
        action: "viewcart",
        
      )
    end

    it "routes to check update the cart" do
      expect(get: "/orders/updatecart").to route_to(
        controller: "orders",
        action: "updatecart"
      )
    end

    it "routes to check the orders checkout" do
      expect(get: "/orders/checkout").to route_to(
        controller: "orders",
        action: "checkout"
      )
    end

  end
end