class CreateAccountBalances < ActiveRecord::Migration
  def change
    create_table :account_balances do |t|
      t.integer :account_id
      t.decimal :balance_before, precision: 2, scale: 12
      t.decimal :amount, precision: 2, scale: 12
      t.decimal :balance, precision: 2, scale: 12
      t.integer :order_payment_id

      t.timestamps
    end
  end
end
