Rails.application.routes.draw do
  root 'libraries#index'
  resources :libraries, :addresses, :books, :authors, :users
end
