require 'rails_helper'

RSpec.describe Product do
  context "creation" do
    it "success" do
      prod = FactoryGirl.build(:product)

      Product.destroy_all
      product = Product.create({name: prod.name, value: prod.value})

      expect(product).to be_valid
    end

    it "failure" do
      prod = FactoryGirl.build(:product)

      Product.destroy_all
      product = Product.create({name: prod.name, value: nil})

      expect(product).not_to be_valid
    end
  end
end
