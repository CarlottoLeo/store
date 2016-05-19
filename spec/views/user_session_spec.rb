require "rails_helper"
require "spec_helper"

RSpec.feature User, :type => :feature do
  scenario "sign up successfully", js: true do
    visit "/users/sign_up"

    fill_in "Email",                :with => "teste@rspec.com"
    fill_in "Senha",                :with => "123456"
    fill_in "Confirmação de Senha", :with => "123456"

    execute_script("$('#signup-form').submit();")

    expect(page).to have_text("Login efetuado com sucesso")
  end

  scenario "sign in successfully", js: true do
    Devise.sign_out_all_scopes

    visit "/users/sign_in"

    fill_in "Email",    :with => "teste@rspec.com"
    fill_in "Senha",    :with => "123456"

    execute_script("$('#signin-form').submit();")

    expect(page).to have_text("Login efetuado com sucesso")
  end
end
