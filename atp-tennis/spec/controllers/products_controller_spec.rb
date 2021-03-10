require 'rails_helper'
require 'spec_helper'

# Instruction from: http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/
RSpec.describe ProductsController, type: :controller do


  #describe Product do
  #  before{(@product = Product.new(productId: 1,  productName: "MyString",  productDescription: "MyString",  productPrice: 1.5,  productColor: "MyString",  productSize: "MyString",  productAvailability: 1,  productImage: "MyText"))}
  #  subject(@product)
 
  #  it "can be saved" do
  #    @product.should respond_to(:save)
  #    @product.save.should_not be_false
  #  end
  #end

  describe "Test on products controller" do
    it "routes /products to products#index" do
      expect(get: "/products").to route_to(
        controller: "products",
        action: "index"
      )
    end

    it "routes /products/1 to products#show" do
      expect(get: "/products/1").to route_to(
        controller: "products",
        action: "show",
        id: "1"
      )
    end

    it "routes /products/new to products#new" do
      expect(get: "/products/new").to route_to(
        controller: "products",
        action: "new"
      )
    end

    it "routes /products to products#create" do
      expect(post: "/products").to route_to(
        controller: "products",
        action: "create"
      )
    end

    it "routes /products/1/edit to products#edit" do
      expect(get: "/products/1/edit").to route_to(
        controller: "products",
        action: "edit",
        id: "1"
      )
    end

    it "routes /products/1 to products#update" do
      expect(put: "/products/1").to route_to(
        controller: "products",
        action: "update",
        id: "1"
      )
    end

    it "routes /products/1 to products#destroy" do
      expect(delete: "/products/1").to route_to(
        controller: "products",
        action: "destroy",
        id: "1"
      )
    end
  end
end