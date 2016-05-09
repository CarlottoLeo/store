require 'rails_helper'

RSpec.describe User do
  context "account" do
    it "is valid" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "is invalid" do
      expect(FactoryGirl.build(:user, email: nil)).to be_invalid
    end
  end
end
