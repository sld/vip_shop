require 'spec_helper'

describe Cart do
  context "Buyings transform" do
    def get_user_with_cart user_balance=500
      product1 = FactoryGirl.build(:product, :price => 100)
      product2 = FactoryGirl.build(:product, :price => 300)

      user = FactoryGirl.create(:user, :balance => user_balance)      

      user.cart.products << product1
      user.cart.products << product2

      return user
    end 


    it "should transform into buying after success user buy" do
      user = get_user_with_cart      

      old_cart = user.cart.clone
      user.buy_cart!            

      user.cart.products.should be_empty
      user.buyings.count.should == 1
      user.buyings.first.cart.products.should == old_cart.products
      user.balance.should == 100
    end


    it "should return false if user cant buy cart" do
      user = get_user_with_cart 100 

      user.buy_cart!.should == false
      user.errors[:buyings].should_not be_blank   
    end
  end
end
