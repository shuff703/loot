class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :recipient
      t.float :amount
      t.string :category
      t.date :date
      t.integer :budget_id

      t.timestamps
    end
  end
end
