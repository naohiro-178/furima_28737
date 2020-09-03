Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  # get 'delivery/index'
  # get 'purchase/index'
  # get 'users/index'
  # resources :users, only: [:edit, :update]
  # resources :items, only: [:create]
end
