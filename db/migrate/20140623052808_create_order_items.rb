class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :godown_item_id
      t.decimal :price, precision: 2, scale: 12
      t.integer :items
      t.decimal :amount, precision: 2, scale: 12
      t.string :notes
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
