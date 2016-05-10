require "rails_helper"

RSpec.feature Product, :type => :feature do
context "create a product" do
    scenario "success", js: true do
      Product.destroy_all

      visit "/products/new"

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "10,0"

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Product was successfully created.")
    end

    scenario "failure", js: true do
      Product.destroy_all

      visit "/products/new"

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "0"

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Value must be greater than 0.01")
    end

    scenario "failure with higher floating precision", js: true do
      Product.destroy_all

      visit "/products/new"

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "0,00000001"

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Value must be greater than 0.01")
    end
  end

  context "update a product" do
    scenario "success", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "100,0"

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Product was successfully updated.")
    end

    scenario "failure", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Name",    :with => ""
      fill_in "Value",   :with => ""

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Oops")
    end

    scenario "failure with higher floating precision", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "0,0000001"

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Oops")
    end

    scenario "failure with empty name", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Name",    :with => ""
      fill_in "Value",   :with => "0,0000001"

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Name can't be blank")
    end

    scenario "failure with empty value", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => ""

      execute_script("$('#product-form').submit();")

      sleep 2.second

      expect(page).to have_text("Value is not a number")
    end
  end
end
