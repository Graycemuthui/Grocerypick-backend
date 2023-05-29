Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers
      resources :payments
      resources :categories
      resources :orders
      resources :products
      resources :categoryproducts
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
end
