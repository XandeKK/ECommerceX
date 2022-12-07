Rails.application.routes.draw do
  devise_for :admins
  post 'search', to: "search#index"
  root 'home#index'
  resources :products, only: [:show]
end
