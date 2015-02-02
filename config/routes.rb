
Rails.application.routes.draw do
  root 'application#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  get '/users/:user_id', :to => "users#show"
end