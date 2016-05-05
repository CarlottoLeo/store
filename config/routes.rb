Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :products

  root "products#index"
end
