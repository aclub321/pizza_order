Rails.application.routes.draw do
  resources :orders, only: %w[index update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "orders#index"
end
