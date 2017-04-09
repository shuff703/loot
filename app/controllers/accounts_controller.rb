class AccountsController < ApplicationController
    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)
        if @account.save
            session[:account_id] = @account.id
            redirect_to '/login'
        else
            redirect_to '/signup'
        end
    end
end

private
    def account_params
        params.require(:account).permit(:username, :password)
    end