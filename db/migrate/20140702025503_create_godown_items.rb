class CreateGodownItems < ActiveRecord::Migration
  def change
    create_table :godown_items do |t|
      t.integer :godown_entry_id
      t.integer :product_id
      t.integer :warehouse_id
      t.string :terminal_code
      t.string :model
      t.string :sn_code
      t.decimal :price, precision: 2, scale: 12
      t.integer :items, default: 1
      t.decimal :amount, precision: 2, scale: 12
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
