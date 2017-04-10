class AddForeignKeyTransactionsBudgets < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :transactions, :budgets, column: :budget_id, primary_key: :id
  end
end
