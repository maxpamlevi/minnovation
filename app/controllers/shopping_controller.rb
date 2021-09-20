class ShoppingController < ApplicationController
  def index
    @new_products = Product.all.limit(2)
    puts @new_products
  end
end
