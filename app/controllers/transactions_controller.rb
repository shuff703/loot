class TransactionsController < ApplicationController
    
    def new
        @budget = Budget.find(params[:budget_id])
        @transaction = Transaction.new
    end
    
    def create
        @budget = Budget.find(params[:budget_id])
        params[:transaction][:category].downcase!
        @transaction = @budget.transactions.create(transaction_params)
        unless @transaction.created_at == nil
            redirect_to @budget
        else
            render 'new'
        end
    end
    
    def index
        @budget = Budget.find(params[:budget_id])
        @transactions = Transaction.where(:budget_id => params[:budget_id]).sort_by &:date
        @transactions.reverse!
        @total_spent = 0
        @utilities = 0
        @food = 0
        @housing = 0
        @entertainment = 0
        @savings = 0
        @transportation = 0
        @debt = 0

        @transactions.each do |transaction|
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
    end
    
    def show
        @budget = Budget.find(params[:budget_id])
        @transaction = Transaction.find(params[:id])
        @transaction.category[0].capitalize!
    end
    def edit
        @budget = Budget.find(params[:budget_id])
        @transaction = Transaction.find(params[:id])
        @transaction.category[0].capitalize!
    end
    def update
        @transaction = Transaction.find(params[:id])
        transaction_params[:category].downcase!
        if @transaction.update(transaction_params)
            redirect_to budget_transaction_path
        else
            render 'edit'
        end
    end
    def destroy
        @transaction = Transaction.find(params[:id])
        @budget = Budget.find(params[:budget_id])
        @transaction.destroy
        
        redirect_to budget_path(@budget)
    end
    
    private
    def transaction_params
        params.require(:transaction).permit(:recipient, :amount, :category, :date)
    end
end
