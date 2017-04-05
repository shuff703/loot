class ChangeAccountsForAuth < ActiveRecord::Migration[5.0]
  def change
    change_table :accounts do |t|
      t.remove :password
      t.string :password_digest
    end
  end
end
