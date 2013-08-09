# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
usr1 = User.create :email => "email@example.com", :password => "password", :password_confirmation => "password", :balance => 10000
usr2 = User.create :email => "email2@example.com", :password => "password", :password_confirmation => "password", :balance => 10000
usr3 = User.create :email => "email3@example.com", :password => "password", :password_confirmation => "password", :balance => 0

20.times{ |i| Product.create( :name => "Product-#{i}", :price => 500 + rand(1500) ) }

# Create 8 Buyings
4.times do |i| 
  2.times{ |j| usr1.cart.products << Product.all[i+j] }
  2.times{ |j| usr2.cart.products << Product.all[4+j+i]}
  usr1.buy_cart!
  usr2.buy_cart!
end



