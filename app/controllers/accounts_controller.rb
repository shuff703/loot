class AccountsController < ApplicationController
    def index
        @accounts = Account.all
    end
    def new
        @account = Account.new
    end
end
