Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)" , locale: LOCALES do
      resources  :orders, except: :edit
      resources  :items
      resources  :people
      resources  :products

      devise_for :users

      get '/:locale' => 'orders#index', locale: LOCALES
  end

  root "orders#index"
end
