class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :catalog
      t.decimal :godown_price, precision: 2, scale: 12
      t.decimal :sale_price, precision: 2, scale: 12
      t.integer :status

      t.timestamps
    end
  end
end
