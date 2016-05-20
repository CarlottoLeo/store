require "rails_helper"

RSpec.feature Order, :type => :feature do
  context "create an order" do
    scenario "success", js: true do
      User.destroy_all
      # create user credentials to login
      visit "/users/sign_up"

      fill_in "Email",                with: "a@a.com"
      fill_in "Senha",                with: "123456"
      fill_in "Confirmação de Senha", with: "123456"

      execute_script("$('#signup-form').submit();")

      # insecure wait for the response
      sleep 3.second

      # create order
      visit 'orders/new'

      # simulate clicks and pressing buttons
      find('#add-nested-field').click
      find('.select2-selection__rendered').click()
      find('.select2-selection__rendered').send_keys :down, :enter
      fill "Quantidade", with: "100"

      # submit
      execute_script("$('#order-submit').submit();")

      expect(page).to have_text("Pedido criado com sucesso")
    end

    scenario "failure", js: true do
      User.destroy_all

      visit "/users/sign_in"

      fill_in "Email",    :with => "a@a.com"
      fill_in "Senha", :with => "123456"

      execute_script("$('#signin-form').submit();")

      sleep 3.second

      visit 'orders/new'

      execute_script("$('#order-submit').submit();")

      expect(page).to have_text("something went wrong")
    end
  end
end
