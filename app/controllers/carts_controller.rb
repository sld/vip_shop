class CartsController < ApplicationController
  def add
    if current_user.cart.products << Product.find(params[:product_id])
      flash[:notice] = "Product succesfully added into cart"
      redirect_to root_url
    end
  end


  def index
    build_user_cart
    @cart_products = current_user.cart.cart_products.includes(:product)    
  end


  def delete_product
    current_user.cart.products.delete(Product.find(params[:product_id]))
    redirect_to carts_index_url
  end


  def increase_quantity
    cart_product = CartProduct.find(params[:cart_product_id])
    cart_product.quantity += 1
    cart_product.save
    redirect_to carts_index_url
  end


  def decrease_quantity
    cart_product = CartProduct.find(params[:cart_product_id])
    cart_product.quantity -= 1
    if cart_product.save
      redirect_to carts_index_url
    else
      flash[:notice] = "Error on decrease cart product quantity"
      render 'index'
    end
  end
end
