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
    
    def edit
        @budget = Budget.find(params[:id])
    end
    
    def update
        @budget = Budget.find(params[:id])
        
        if @budget.update(budget_params)
            redirect_to @budget
        else
            render 'edit'
        end
    end
    
    def show
        @budget = Budget.find(params[:id])
        @transactions = Transaction.where(:budget_id => @budget.id)
        @totalSpent = 0
        @transactions.each do |transaction|
            @totalSpent = @totalSpent + transaction.amount
        end
        @remaining = @budget.limit - @totalSpent
        @transactions = Transaction.where(:budget_id => @budget.id).limit(10).sort_by &:date
        @transactions.reverse!
    end
    
    def destroy
        @budget = Budget.find(params[:id])
        @budget.destroy
        
        redirect_to budgets_path
    end
end

private
    def budget_params
        params.require(:budget).permit(:name, :limit)
    end