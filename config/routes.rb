Rails.application.routes.draw do

  resources :sessions, only: ['new', 'create', 'destroy']
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'
  resources :posts
  resources :users
  resources :adverts
  resources :products
  resources :product_categories
  resources :companies
  resources :posts do
    collection do
      post :pre_create
    end
  end

  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
