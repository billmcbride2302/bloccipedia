Rails.application.routes.draw do
  devise_for :users
  get 'charges/create'
  get 'welcome/index'
  get 'welcome/about'
  devise_for :wikis
  resources :wikis
  resources :charges, only: [:new, :create]
end


# { confirmations: 'confirmations' }