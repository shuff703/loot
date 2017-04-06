class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        @account = Account.find_by_username(params[:session][:email])
        
        if @account && @account.authenticate(params[:session][:password])
            session[:account_id] = @account.id
            redirect_to 'account_budgets' 
        else
            redirect_to '/login'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
