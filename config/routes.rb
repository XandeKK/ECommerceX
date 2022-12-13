Rails.application.routes.draw do
  devise_for :admins

  root 'home#index'
  resources :products, except: [:index]

  get 'search', to: "search#index"

  get 'checkout/success'
  get 'checkout/cancel'
  post 'checkout/session', to: 'checkout#checkout_session'
end
