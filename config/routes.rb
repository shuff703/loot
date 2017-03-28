Rails.application.routes.draw do
  get 'accounts/index'
  
  root 'accounts#index'
end
