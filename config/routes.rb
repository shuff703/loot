Rails.application.routes.draw do
  get 'accounts/index'
  
  resources :accounts do
    resources :budgets do
      resources :transactions
    end
  end
  
  post "sign_in" => "authentication#login"
  get "sign_in" => "authentication#sign_in"
  
  root 'budgets#index'
end
