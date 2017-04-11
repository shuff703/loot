Rails.application.routes.draw do
  
  resources :accounts
  
  resources :budgets do
<<<<<<< HEAD
      end
=======
    resources :transactions
    end
>>>>>>> 6d39f9e78eec198f8933fa4287dc5dda14dc3d85
  
  get 'accounts/index'
  get 'signup' => 'accounts#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  root 'sessions#new'

end
