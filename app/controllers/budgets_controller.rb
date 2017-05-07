class BudgetsController < ApplicationController
    before_action :require_username
    
    @categories = ["utilities", "food", "housing", "entertainment", "savings", "transportation", "debt"]
    
    def index 
        @budgets = Budget.where(:account_id => session[:account_id])
        if @budgets.empty?
            @budget = Budget.new
            render 'new'
        end
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
        @total_spent = 0
        @utilities = 0
        @food = 0
        @housing = 0
        @entertainment = 0
        @savings = 0
        @transportation = 0
        @debt = 0
        
        @budget = Budget.find(params[:id])
        
        @budget.transactions.each do |transaction|
            case transaction.category
            when Loot::CATEGORIES.fetch(0)
                @utilities += transaction.amount
            when Loot::CATEGORIES.fetch(1)
                @food += transaction.amount
            when Loot::CATEGORIES.fetch(2)
                @housing += transaction.amount
            when Loot::CATEGORIES.fetch(3)
                @entertainment += transaction.amount
            when Loot::CATEGORIES.fetch(4)
                @savings += transaction.amount
            when Loot::CATEGORIES.fetch(5)
                @transportation += transaction.amount
            when Loot::CATEGORIES.fetch(6)
                @debt += transaction.amount
            end
        end
        @total_spent = @utilities + @food + @housing + @entertainment + @savings +
        @transportation + @debt
        
        @remaining = @budget.limit - @total_spent
        
        @transactions = @budget.transactions
        @all_transactions = @transactions.sort_by &:date
        unless @budget.transactions.empty?
            @transactions = @transactions.first(10).sort_by(&:date).reverse
        end
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


