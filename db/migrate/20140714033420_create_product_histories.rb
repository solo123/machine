class CreateProductHistories < ActiveRecord::Migration
  def change
    create_table :product_histories do |t|
      t.integer :warehouse_id
      t.integer :product_id
      t.references :operate_sheet, polymorphic: true
      t.integer :before_items
      t.integer :change_items
      t.integer :now_items
      t.integer :employee_id

      t.timestamps
    end
  end
end
