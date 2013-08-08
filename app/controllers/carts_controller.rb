class CartsController < ApplicationController
  def add
    if current_user.cart.products << Product.find(params[:product_id])
      flash[:notice] = "Product succesfully added into cart"
      redirect_to root_path
    end
  end
end
