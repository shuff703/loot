class Transaction < ApplicationRecord
  belongs_to :budget
  validates :recipient, presence: true
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than: 0
  validates :category, presence: true
  validates :date, presence: true
end
