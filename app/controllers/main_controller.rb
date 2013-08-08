class MainController < ApplicationController
  def index
    build_user_cart
    @products = Product.limit(15)
  end
end
