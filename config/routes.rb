Rails.application.routes.draw do
  get 'accounts/index'
  
  resources :accounts
  
  root 'accounts#index'
end
