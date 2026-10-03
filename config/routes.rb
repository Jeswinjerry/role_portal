Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]

  root "users#index"

  resources :users, only: [:index, :new, :create]
end