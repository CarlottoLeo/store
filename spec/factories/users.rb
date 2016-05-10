require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email    { Faker::Internet.safe_email }
    f.password { Faker::Internet.password 6 }
  end
end
