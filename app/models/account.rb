class Account < ApplicationRecord
    def self.authenticate(username, password)
        account = find_by_username(username)
        if account && password
            account
        else
            nil
        end
    end
    
    private def find_by_username username
       Account.find(username) 
    end
    
end
