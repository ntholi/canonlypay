Rails.application.routes.draw do

  resources :posts
  resources :users
  resources :adverts
  resources :products
  resources :product_categories
  resources :advertisers
  resources :posts do
    collection do
      post :pre_create
    end
  end

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
