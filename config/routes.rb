Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'cart', to: 'pages#cart'
  resources :products, only: [:index, :show] do
    resources :reviews, only: [ :new, :create, :edit, :update, :destroy ]
    member do
      post 'toggle_favorite', to: "products#toggle_favorite"
    end
  end

  resources :users, only: [:show, :edit, :update] 
end
