Rails.application.routes.draw do

  root 'listings#index'

  resources :listings

  resources :users

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  delete 'login', to: 'sessions#destroy'

  get '/price_response', to: 'listings#price_response'
end
