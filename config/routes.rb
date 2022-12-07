Rails.application.routes.draw do
  post 'search', to: "search#index"
  root 'home#index'
  resources :products, only: [:show]
end
