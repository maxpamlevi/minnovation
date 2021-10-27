class ShoppingController < ApplicationController
  def index
    @new_products = Product.all.limit(2)
  end
end
