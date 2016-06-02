Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)" , locale: LOCALES do
      resources  :orders, except: :edit
      resources  :items
      resources  :people

      resources :products do
        collection do
          match 'search' => "products#search" , via: [:get, :post], as: :search
        end
      end

      devise_for :users

      get '/:locale' => 'orders#index', locale: LOCALES
  end



  root "orders#index"
end
