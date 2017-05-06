class Budget < ApplicationRecord
    belongs_to :account
    has_many :transactions, dependent: :destroy
    validates :name, presence: true, uniqueness: true
    validates :limit, presence: true
    validates_numericality_of :limit, greater_than_or_equal_to: 0
end
