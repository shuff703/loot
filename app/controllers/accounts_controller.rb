class AccountsController < ApplicationController
    def index
        @accounts = Account.all
    end
    
    def new
        @account = Account.new
    end
    
    def create
        @account = Account.new(account_params)

        if @account.save
            redirect_to @account
        else
            render 'new'
        end 
    end
end
