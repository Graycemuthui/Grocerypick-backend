Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :customers
      resources :payments
      resources :categories
      resources :orders
      resources :products
    end
  end
end
