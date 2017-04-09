class BudgetsController < ApplicationController
    before_action :require_username
    
    def index 
        @budgets = Budget.where(:account_id => session[:account_id])
    end
    
    def new
        @budget = Budget.new
    end
    
    def create
        @budget = Budget.new(budget_params)
        @budget.account_id = session[:account_id]
        if @budget.save
            redirect_to @budget
        else
            render 'new'
        end 
    end
    def show
        #@transactions = Transaction.find(:budget_id)
    end
end

private
    def budget_params
        params.require(:budget).permit(:name, :limit)
    end