class CreateGodownEntries < ActiveRecord::Migration
  def change
    create_table :godown_entries do |t|
      t.string :godown_number
      t.integer :total_items
      t.decimal :total_amount, precision: 2, scale: 12
      t.integer :status, default: 0
      t.integer :creator_id

      t.timestamps
    end
  end
end
