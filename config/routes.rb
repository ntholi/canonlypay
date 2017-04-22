Rails.application.routes.draw do
  
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations',  }
  resources :posts
  resources :users
  resources :adverts do
    resources :advert_comments, only: [:create, :destroy]
  end
  resources :products
  resources :product_categories
  resources :companies
  resources :posts do
    collection do
      post :pre_create
    end
    resources :post_comments, only: [:create, :destroy]
  end

  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
