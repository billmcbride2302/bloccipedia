Rails.application.routes.draw do
  root to: 'charges#new'
  devise_for :users
  resources :users do
    member do
      post :downgrade
    end
  end
  get 'charges/create'
  get 'welcome/index'
  get 'welcome/about'
  devise_for :wikis
  resources :wikis
  resources :charges, only: [:new, :create]
end


# { confirmations: 'confirmations' }