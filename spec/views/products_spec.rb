require "rails_helper"

RSpec.feature Product, :type => :feature do
  context "create a product" do
    scenario "success", js: true do
      visit "/products/new"

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "10,0"

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Product was successfully created.")
    end

    scenario "failure", js: true do
      visit "/products/new"

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "0"

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Value must be greater than 0.01")
    end

    scenario "failure with higher floating precision", js: true do
      visit "/products/new"

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "0,00000001"

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Value must be greater than 0.01")
    end
  end

  context "edit a product" do
    scenario "success" do
      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit '/products/1/edit'

      fill_in "Name",    :with => "Nome editado"
      fill_in "Value",   :with => "5.0"

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Product was successfully updated.")
    end

    scenario "failure" do
      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit '/products/1/edit'

      fill_in "Name",    :with => ""
      fill_in "Value",   :with => ""

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Oops")
    end

    scenario "failure with higher floating precision" do
      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit '/products/1/edit'

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => "0.0000001"

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Oops")
    end

    scenario "failure with empty name" do
      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit '/products/1/edit'

      fill_in "Name",    :with => ""
      fill_in "Value",   :with => "0.0000001"

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Name can't be blank")
    end

    scenario "failure with empty value" do
      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit '/products/1/edit'

      fill_in "Name",    :with => "Produto Teste RSPEC"
      fill_in "Value",   :with => ""

      execute_script("$('#product-form').submit();")

      expect(page).to have_text("Value is not a number")
    end
  end

#  [[not working]]
#  context "destroy a product" do
#    scenario "success" do
#      Product.create({name: "Produto Teste RSPEC", value: "10.0"})
#
#      visit "/products"
#
#      send "/products/1", :method => :delete
#      #expect { click_link 'Destroy' }.to change(Category, :count).by(-1)
#      expect(Product.find_by_id(1)).to eq(nil)
#    end
#  end
end
