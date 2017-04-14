class TransactionsController < ApplicationController
    
    def new
        @budget = Budget.find(params[:budget_id])
        @transaction = Transaction.new
    end
    
    def create
        @budget = Budget.find(params[:budget_id])
        @budget.transactions.create(transaction_params)
        redirect_to @budget
    end
    
    def index
        @budget = Budget.find(params[:budget_id])
    end
    
    def show
        @transaction = Transaction.find(params[:id])
    end
    def edit
        @budget = Budget.find(params[:budget_id])
        @transaction = Transaction.find(params[:id])
    end
    def update
        @budget = Budget.find(params[:budget_id])
        if @budget.transactions.update(transaction_params)
            redirect_to budget_transaction_path
        else
            render 'edit'
        end
    end
    def destroy
    end
    
    private
    def transaction_params
        params.require(:transaction).permit(:recipient, :amount, :category, :date)
    end
end
