require 'rails_helper'

RSpec.describe Product do
  def attr2hash(f)
    {name: f.name, value: f.value}
  end

  context "create" do
    it "succeed" do
      prod = attr2hash(FactoryGirl.build(:product))

      Product.destroy_all
      product = Product.create(prod)

      expect(product).to be_valid
    end

    it "fails" do
      prod = FactoryGirl.build(:product)

      Product.destroy_all
      product = Product.create({name: prod.name, value: nil})

      expect(product).not_to be_valid
    end
  end

  context "update" do
    it "succeed" do
      prod = Product.create(attr2hash(FactoryGirl.build(:product)))
      prod.update(attr2hash(FactoryGirl.build(:product)))

      expect(prod).to be_valid
    end

    it "fails" do
      prod = Product.create(attr2hash(FactoryGirl.build(:product)))
      prod.update({name: prod.name, value: '-0.1'})

      expect(prod.value).not_to be > 0.01
    end
  end
end
