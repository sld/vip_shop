class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :buying
  
  has_many :cart_products, :dependent => :destroy
  has_many :products, :through => :cart_products

  def total_price
    cart_products.inject(0){|s,cart_product| s += cart_product.quantity*cart_product.product.price}
  end
end
