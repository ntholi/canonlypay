Rails.application.routes.draw do
  resources :posts
  resources :users
  resources :adverts
  resources :products
  resources :advertisers
  resources :product_categories
  resources :posts do
    collection do
      post :pre_create
    end
  end

  get 'home/index'
  get 'home/about_us'
  get 'home/contact_us'
  get 'home/connect_with_us'
  get 'home/privacy_policy'
  get 'home/terms_of_use'

  root 'home#index' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
