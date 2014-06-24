class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :order_number
      t.integer :provider_id
      t.integer :total_items, default: 0
      t.decimal :total_amount, precision: 2, scale: 12 
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
