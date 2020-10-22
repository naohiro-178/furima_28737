Rails.application.routes.draw do
  devise_for :users, controllers: {
    ommiauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root "items#index"
  resources :users
  resources :items do
    resources :purchases, only:[:index, :new, :create]
  end
end

