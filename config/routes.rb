Rails.application.routes.draw do
  devise_for :users
  root 'libraries#index'
  resources :libraries, :addresses, :books, :authors, :permitted_tables, :queries, :roles, :permitted_column_sets
  resources :users do
    member do
      post 'generate_api_key'
    end
  end

  get '/request/api/v1/:query_name/(:column_set)', to: 'requests#show'

end
