class AccountsController < ApplicationController
    def index
<<<<<<< HEAD
=======
        @accounts = Account.all
    end
    def new
        @account = Account.new
>>>>>>> 3ab38ddbbb986940b4bdb5ebf5c7fbd50fc307d9
    end
end
