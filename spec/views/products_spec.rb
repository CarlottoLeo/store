require "rails_helper"

RSpec.feature Product, :type => :feature do
  context "create" do
    scenario "success", js: true do
      visit "/pt-BR/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "10,0"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("O produto foi criado com sucesso")
    end

    scenario "failure", js: true do
      visit "/pt-BR/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("Value deve ser maior que 0.01")
    end

    scenario "failure with higher floating precision", js: true do
      visit "/pt-BR/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0,00000001"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("deve ser maior que 0.01")
    end
  end

  context "update" do
    scenario "success", :js => true do
      prod = Product.find_by_id(1)

      visit '/products/' + prod.id.to_s + '/edit'

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "100,0"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("O produto foi atualizado com sucesso")
      Product.destroy_all
    end

    scenario "failure", :js => true do
      prod = Product.find_by_id(1)

      visit '/products/' + prod.id.to_s + '/edit'

      fill_in "Nome",    :with => ""
      fill_in "Valor",   :with => ""

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("Oops")
      Product.destroy_all
    end

    scenario "failure with higher floating precision", :js => true do
      prod = Product.find_by_id(1)

      visit '/products/' + prod.id.to_s + '/edit'

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0,0000001"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("Oops")
      Product.destroy_all
    end

    scenario "failure with empty name", :js => true do
      prod = Product.find_by_id(1)

      visit '/products/' + prod.id.to_s + '/edit'

      fill_in "Nome",    :with => ""
      fill_in "Valor",   :with => "0,0000001"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("não pode ficar em branco")
      Product.destroy_all
    end

    scenario "failure with empty value", :js => true do
      prod = Product.find_by_id(1)

      visit '/products/' + prod.id.to_s + '/edit'

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => ""

      execute_script("$('#product-form').submit();")

      sleep 3
      expect(page).to have_text("não pode ficar em branco")
      Product.destroy_all
    end
  end
end
