class TransactionsController < ApplicationController
    before_action :require_username
    def index
        @transactions = Transaction.all
    end
end
