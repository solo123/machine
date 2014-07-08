class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :order_date
      t.string :order_number
      t.integer :partner_id
      t.string :contact_name
      t.string :contact_tel
      t.string :contact_email
      t.integer :total_items, default: 0
      t.decimal :total_amount, precision: 2, scale: 12 
      t.string :notes
      t.integer :order_type, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
