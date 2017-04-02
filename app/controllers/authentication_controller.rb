class AuthenticationController < ApplicationController
    def login
        username = params[:account][:username]
        password = params[:account][:password]
        
        account = Account.authenticate(username, password)

        if account
            redirect_to :root
        else
            render :action => "sign_in"
        end 
    end
    def sign_in
        @user = User.new
    end
end
