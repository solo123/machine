class CreateGodownEntries < ActiveRecord::Migration
  def change
    create_table :godown_entries do |t|
      t.string :godown_number
      t.integer :product_id
      t.integer :warehouse_id
      t.integer :total_items
      t.decimal :total_amount, precision: 2, scale: 12
      t.integer :status, default: 0
      t.integer :creator_id
      t.string :notes

      t.timestamps
    end
  end
end
