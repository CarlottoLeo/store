require 'faker'

FactoryGirl.define do
  factory :order do |f|
    f.products   { ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'] }
  end
end
