class TransactionsController < ApplicationController
    
    def new
        @transaction = Transaction.new
    end
    
    def create
        #@budget = Budget.find(params[:budget_id])
       # @transaction = 
    end
    
    def index
    end
end
