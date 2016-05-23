require "rails_helper"

RSpec.feature Product, :type => :feature do
  context "create" do
    scenario "success", js: true do
      visit "/pt-BR/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "10.0"

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

      expect(page).to have_text("deve ser maior que 0.01")
    end

    scenario "failure with higher floating precision", js: true do
      visit "/pt-BR/products/new"

      fill_in "Nome",    :with => "Produto Teste RSPEC"
      fill_in "Valor",   :with => "0.00000001"

      execute_script("$('#product-form').submit();")

      sleep 3

      expect(page).to have_text("deve ser maior que 0.01")
    end
  end
end
