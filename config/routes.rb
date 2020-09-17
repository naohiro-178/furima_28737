Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items
  resources :users
  resources :purchase, only:[:create]
end
