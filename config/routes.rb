Rails.application.routes.draw do
  devise_for :admins
  get 'search', to: "search#index"
  root 'home#index'
  resources :products, except: [:index]
end
