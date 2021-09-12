Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  resources :products, only: [:index, :show] do
    resources :reviews, only: [:create, :update, :destroy ]
    member do
      post 'toggle_favorite', to: "products#toggle_favorite"
    end
  end

  resources :users, only: [:show, :update]
  resources :orders, only: [:edit, :update]
  resources :order_items, only: [:create, :destroy]
  resources :charges, only: [:new, :create], path: 'cart'
end
