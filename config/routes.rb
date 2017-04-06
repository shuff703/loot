Rails.application.routes.draw do
  get 'accounts/index'
  
  # resources :accounts do
  #   resources :budgets do
  #     resources :transactions
  #   end
  # end
  
  get 'signup' => 'accounts#new'
  
<<<<<<< HEAD
  root 'accounts#index'
=======
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  root 'sessions#new'
>>>>>>> 13ef1ab70c8d70cb162daff0be865256a715eda7
end
