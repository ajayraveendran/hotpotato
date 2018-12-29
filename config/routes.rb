Rails.application.routes.draw do

  resources :watchlists
  root 'listings#index'

  resources :listings

  get '/filter/:category', to: 'listings#filter'

  resources :users

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'
  
  delete 'login', to: 'sessions#destroy'

  get '/price_response', to: 'listings#price_response'

  post '/watchlist', to: 'watchlists#create'
  get '/watchlist', to: 'watchlists#get_watchlist_count'

  get 'listings/:id/connect', to: 'listings#connect'
end
