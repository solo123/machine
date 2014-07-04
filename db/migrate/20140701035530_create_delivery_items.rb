class CreateDeliveryItems < ActiveRecord::Migration
  def change
    create_table :delivery_items do |t|
      t.integer :delivery_id
      t.string :t_code
      t.string :item_name
      t.integer :items
      t.decimal :price
      t.decimal :amount
      t.integer :status

      t.timestamps
    end
  end
end
