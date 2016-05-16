Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope "(:locale)" , locale: LOCALES do
      resources  :orders
      resources  :products
      devise_for :users
  end

  get '/:locale' => 'products#index', locale: LOCALES

  root "products#index"
end
