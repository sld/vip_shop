class BuyingsController < ApplicationController
  def index
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
