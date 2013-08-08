# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create :email => "email@example.com", :password => "password", :password_confirmation => "password"
User.create :email => "email2@example.com", :password => "password", :password_confirmation => "password"

20.times{ |i| Product.create( :name => "Product-#{i}", :price => 500 + rand(1500) ) }
