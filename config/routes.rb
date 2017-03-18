Rails.application.routes.draw do
  get 'aplicacion/graphic'

  LOCALES = /en|pt\-BR/

  scope '(:locale)', locale: LOCALES do
    resources  :orders, except: :edit
    resources  :items
    resources  :people
    resources  :products
    resources  :report
    resources  :aplication

    devise_for :users

    get '/:locale' => 'orders#index', locale: LOCALES
    get '/aplicacion/graphic'
    get '/aplicacion/graphic_people'
  end

  root 'orders#index'
end
