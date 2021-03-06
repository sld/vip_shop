class BuyingsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index


  def index
    @buyings = Buying.includes( :user, :cart => { :cart_products => :product } ).order('created_at desc').page( params[:page] )
  end


  def create_from_cart
    respond_to do |format|
      if current_user.buy_cart!     
        flash[:notice] = "Cart successfully bought!"
        flash.keep(:notice)   
        format.js{ render js: "window.location = '#{root_url}'" }
      else
        format.js
      end
    end
  end
  
end
