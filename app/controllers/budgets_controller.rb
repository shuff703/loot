class BudgetsController < ApplicationController
    before_action :require_account
    
    def index 
        @budgets = Budget.all
    end
    
    def new
        @budget = Budget.new
    end
    
    def create
        @budget = Budget.new(budget_params)

        if @budget.save
            redirect_to @budget
        else
            render 'new'
        end 
    end    
end

private
    def budget_params
        params.require(:budget).permit(:name, :limit)
    end