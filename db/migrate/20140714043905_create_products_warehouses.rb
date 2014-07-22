class CreateProductsWarehouses < ActiveRecord::Migration
  def change
    create_table :products_warehouses do |t|
      t.belongs_to :warehouse
      t.belongs_to :product
      t.integer :store_item, default: 0

      t.timestamps
    end
  end
end
