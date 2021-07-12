Rails.application.routes.draw do
  get "devise_test", to: 'application#test'
  root to: "books#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  resources :loans
  resources :users
  resources :genres
  resources :authors
  resources :books

end
