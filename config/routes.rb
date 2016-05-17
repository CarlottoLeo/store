Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)" , locale: LOCALES do
      resources  :orders

      resources :products do
        collection do
          match 'search' => "products#search" , via: [:get, :post], as: :search
        end
      end

      devise_for :users
  end

  get '/:locale' => 'products#index', locale: LOCALES

  root "products#index"
end
