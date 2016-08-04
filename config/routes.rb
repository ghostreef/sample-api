Rails.application.routes.draw do
  root 'libraries#index'
  resources :libraries, :addresses, :books, :authors
  resources :users do
    member do
      post 'generate_api_key'
    end
  end
end
