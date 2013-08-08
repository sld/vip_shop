class CartsController < ApplicationController
  def add
    if current_user.cart.products << Product.find(params[:product_id])
      flash[:notice] = "Product succesfully added into cart"
      redirect_to root_path
    end
  end


  def index
    build_user_cart
    @cart_products = current_user.cart.cart_products.includes(:product)    
  end
end
