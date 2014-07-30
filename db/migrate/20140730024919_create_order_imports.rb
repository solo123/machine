class CreateOrderImports < ActiveRecord::Migration
  def change
    create_table :order_imports do |t|
      t.string :product_name
      t.integer :product_id
      t.string :terminal_code
      t.string :sn_code
      t.decimal :price, precision: 2, scale: 12
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
