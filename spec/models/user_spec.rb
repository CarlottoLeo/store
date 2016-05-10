require 'rails_helper'

RSpec.describe User do
  context "account" do
    it "is valid" do
      userf = FactoryGirl.build(:user)

      User.destroy_all
      user = User.create({email: userf.email, password: userf.password})

      expect(user).to be_valid
    end

    it "is invalid" do
      userf = FactoryGirl.build(:user)

      User.destroy_all
      user = User.create({email: nil, password: userf.password})

      expect(user).not_to be_valid
    end
  end
end
