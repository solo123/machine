class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :delivery_number
      t.integer :partner_id
      t.date :delivery_date
      t.integer :total_items
      t.decimal :total_amount
      t.integer :creator_id
      t.integer :delivery_staff_id
      t.string :accounting_voucher_number
      t.integer :status

      t.timestamps
    end
  end
end
