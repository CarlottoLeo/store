require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.name   { Faker::Commerce.product_name }
    f.value  { Faker::Commerce.price }
  end
end
