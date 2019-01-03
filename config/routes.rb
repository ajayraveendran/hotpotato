Rails.application.routes.draw do

  root 'listings#index'

  resources :listings

  get '/filter/:category', to: 'listings#filter'

  resources :users

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  delete 'login', to: 'sessions#destroy'

  get '/price_response', to: 'listings#price_response'

  get 'watchlist', to: 'listings#show_watchlist'
  post 'watchlist/:id', to: 'listings#toggle_watchlist'

  get 'listings/:id/connect', to: 'listings#connect'

  
end
