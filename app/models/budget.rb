class Budget < ApplicationRecord
    belongs_to :account
    has_many :transactions, dependent: :destroy
end
