Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }
  root to: "shops#index"
  resources :shops, only: [:index, :new, :create]
end
