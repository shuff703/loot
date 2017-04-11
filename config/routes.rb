Rails.application.routes.draw do
  
  resources :accounts
  
  resources :budgets do
      end
  
  get 'accounts/index'
  get 'signup' => 'accounts#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  root 'sessions#new'

end
