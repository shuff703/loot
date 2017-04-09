class BudgetsController < ApplicationController
    #before_action :require_account
    
    def index 
        @budgets = Budget.all
    end
    
    def new
        @budgets = Budget.new
    end
    
    def create
        @budgets = Budget.new(budget_params)

        if @budgets.save
            redirect_to @budgets
        else
            render 'new'
        end 
    end    
end

private
    def budget_params
        params.require(:budget).permit(:name, :limit)
    end