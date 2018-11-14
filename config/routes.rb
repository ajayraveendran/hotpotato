Rails.application.routes.draw do

  root 'pages#home'

  resources :listings

  get '/price_response', to: 'listings#price_response'
end
