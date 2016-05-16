require "rails_helper"
require "spec_helper"

Capybara.default_driver = :webkit

RSpec.feature User, :type => :feature do
  scenario "sign up successfully and redirects to root", js: true do
    User.destroy_all

    visit "/en/users/sign_up"

    fill_in "Email",    :with => "teste@rspec.com"
    fill_in "Password", :with => "123456"
    fill_in "Password confirmation", :with => "123456"

    execute_script("$('#signup-form').submit();")

    expect(page).to have_text("signed up success")
  end

  scenario "sign in successfully redirects to root", js: true do
    Devise.sign_out_all_scopes
    User.create({email: "teste@rspec.com", password: "123456"})

    puts(User.all)

    visit "/en/users/sign_in"

    fill_in "Email",    :with => "teste@rspec.com"
    fill_in "Password", :with => "123456"

    execute_script("$('#signin-form').submit();")

    expect(page).to have_text("Signed in successfully")
  end
end
