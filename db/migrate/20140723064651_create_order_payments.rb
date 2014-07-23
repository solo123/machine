class CreateOrderPayments < ActiveRecord::Migration
  def change
    create_table :order_payments do |t|
      t.integer :order_id
      t.decimal :balance_before, precision: 2, scale: 12
      t.decimal :pay_amount, precision: 2, scale: 12
      t.decimal :balance, precision: 2, scale: 12, default: 0

      t.timestamps
    end
  end
end
