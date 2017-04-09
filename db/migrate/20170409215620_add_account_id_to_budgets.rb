class AddAccountIdToBudgets < ActiveRecord::Migration[5.0]
  def change
    add_column :budgets, :account_id, :integer
  end
end
