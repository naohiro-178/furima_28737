Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  resources :users
  resources :purchases, only:[:index, :new, :create]
end
