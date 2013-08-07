class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :buying
  
  has_many :cart_products
  has_many :products, :through => :cart_products
end
