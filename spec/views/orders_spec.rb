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

      # insecure wait for the response
      sleep 3.second

      # create order
      visit 'orders/new'

      # simulate clicks and pressing buttons
      find('div[class="default text"]').click
      find('div[class="menu transition visible"]').send_keys :down, :enter

      # submit
      execute_script("$('#order-form').submit();")

      expect(page).to have_text("Order was successfully created.")
    end

    scenario "failure", js: true do
      User.destroy_all

      visit "/users/sign_up"

      fill_in "Email",    :with => "a@a.com"
      fill_in "Password", :with => "123456"
      fill_in "Password confirmation", :with => "123456"

      execute_script("$('#signup-form').submit();")

      sleep 3.second

      visit 'orders/new'

      execute_script("$('#order-form').submit();")

      expect(page).to have_text("Can't submit an empty cart.")
    end
  end
end
