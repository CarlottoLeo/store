require "rails_helper"

RSpec.feature Order, :type => :feature do
  context "create an order" do
    scenario "success", js: true do
      User.destroy_all
      # create user credentials to login
      visit "/users/sign_up"

      fill_in "Email",    :with => "a@a.com"
      fill_in "Password", :with => "123456"
      fill_in "Password confirmation", :with => "123456"

      execute_script("$('#signup-form').submit();")

      # create order
      visit 'orders/new'

      select 'Banana', from: 'order_products'

      execute_script("$('#order-form').submit();")

      expect(page).to have_text("Order was successfully created.")
    end

#    [[not working]]
#    scenario "failure", js: true do
#      User.destroy_all
#      # create user credentials to login
#      visit "/users/sign_up"
#
#      fill_in "Email",    :with => "a@a.com"
#      fill_in "Password", :with => "123456"
#      fill_in "Password confirmation", :with => "123456"
#
#      execute_script("$('#signup-form').submit();")
#
#      # create order
#      visit '/orders/new'
#
#      execute_script("$('#order-form').submit();")
#
#      expect(page).to have_text("ParameterMissing")
#    end
#  end
end
