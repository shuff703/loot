Rails.application.routes.draw do
  get 'accounts/index'
  
  resources :accounts do
    resources :budgets do
      resources :transactions
    end
  end
  
  get 'signup' => 'accounts#new'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  root 'sessions#new'

end
