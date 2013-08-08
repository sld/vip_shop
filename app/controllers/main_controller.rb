class MainController < ApplicationController
  def index
    build_user_cart
    @products = Product.limit(15)
  end


  private


  def build_user_cart
    current_user.cart || current_user.create_cart 
  end
end
