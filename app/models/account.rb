class Account < ApplicationRecord
    has_secure_password
    has_many :budgets, dependent: :destroy
end
