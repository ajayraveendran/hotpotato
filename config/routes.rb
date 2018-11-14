Rails.application.routes.draw do
  resources :listings

  get '/price_response', to: 'listings#price_response'
end
