Rails.application.routes.draw do
  devise_for :users
  root 'libraries#index'
  resources :libraries, :addresses, :books, :authors, :permitted_tables, :queries
  resources :users do
    member do
      post 'generate_api_key'
    end
  end

  get '/request/:slug', to: 'requests#show'

end
