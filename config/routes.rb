Rails.application.routes.draw do
  get 'delivery/index'
  get 'purchase/index'
  get 'users/index'
  devise_for :users
  root "items#index"
  resources :users, only: [:edit, :update]
end
