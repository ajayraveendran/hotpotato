Rails.application.routes.draw do

  root 'listings#index'

  resources :listings

  get '/price_response', to: 'listings#price_response'
end
