class MainController < ApplicationController
  def index
    @products = Product.limit(15)
  end
end
