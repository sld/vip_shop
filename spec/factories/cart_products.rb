# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cart_product do
    cart_id 1
    product_id 1
    quantity 1
  end
end
