Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get "welcome/index"
    get "devise_test", to: 'application#test'
    root to: "welcome#index"
end
