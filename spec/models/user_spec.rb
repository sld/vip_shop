require 'spec_helper'

describe User do
  it "always should have the cart" do
    usr = FactoryGirl.create :user
    usr.cart.should_not == nil

    old_cart_id = usr.cart.id 

    usr.cart.user = nil
    usr.cart.save!
    
    usr.reload    

    usr.cart.should_not == nil 
    usr.cart.id.should_not == old_cart_id
  end
end
