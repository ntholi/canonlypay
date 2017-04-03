Rails.application.routes.draw do
  
  resources :posts
  resources :users
  resources :adverts do
    resources :advert_comments
  end
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
