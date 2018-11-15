Rails.application.routes.draw do

  root 'pages#home'

  resources :listings

  resources :users

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  delete 'login', to: 'sessions#destroy'

  get '/price_response', to: 'listings#price_response'
end
