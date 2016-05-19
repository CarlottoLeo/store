require "rails_helper"

RSpec.feature Product, :type => :feature do
context "create a product" do
    scenario "success", js: true do
      Product.destroy_all

      visit "/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "10,0"

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("O produto foi criado com sucesso.")
    end

    scenario "failure", js: true do
      Product.destroy_all

      visit "/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0"

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("Value deve ser maior que 0.01")
    end

    scenario "failure with higher floating precision", js: true do
      Product.destroy_all

      visit "/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0,00000001"

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("Value deve ser maior que 0.01")
    end
  end

  context "update a product" do
    scenario "success", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "100,0"

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("O produto foi atualizado com sucesso.")
    end

    scenario "failure", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Nome",    :with => ""
      fill_in "Valor",   :with => ""

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("Oops")
    end

    scenario "failure with higher floating precision", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0,0000001"

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("Oops")
    end

    scenario "failure with empty name", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Nome",    :with => ""
      fill_in "Valor",   :with => "0,0000001"

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("Name não pode ficar em branco.")
    end

    scenario "failure with empty value", :js => true do
      Product.destroy_all

      prod = Product.create({name: "Produto Teste RSPEC", value: "10.0"})

      visit edit_product_path(prod)

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => ""

      execute_script("$('#product-form').submit();")

      follow_redirect!

      expect(page).to have_text("Value não pode ficar em branco.")
    end
  end
end
