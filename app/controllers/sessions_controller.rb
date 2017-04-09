class SessionsController < ApplicationController
    def new
        
    end
    
    def create
        byebug
        @account = Account.find_by_username(params[:session][:username])
        
        if @account && @account.authenticate(params[:session][:password])
            session[:account_id] = @account.id
            redirect_to '/budgets/index'
        else
            redirect_to '/signup'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
end
