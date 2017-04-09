class AddForeignKeyAccountBudget < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :budgets, :accounts, column: :account_id, primary_key: :id
  end
end
