class AuthenticationController < ApplicationController
    def login
        username = params[:account][:username]
        password = params[:account][:password]
        
        account = Account.authenticate(username, password)

        if account
            redirect_to :root
        end
    end
    def sign_in
        @account = Account.new
    end
end
