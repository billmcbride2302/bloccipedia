Rails.application.routes.draw do
  devise_for :users
  resources :wikis
end


# { confirmations: 'confirmations' }