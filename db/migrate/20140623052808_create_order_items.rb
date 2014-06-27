class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :provider_id
      t.integer :order_id
      t.string :t_code
      t.string :model
      t.string :sn_code
      t.decimal :price, precision: 2, scale: 12
      t.string :mobile_number
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
