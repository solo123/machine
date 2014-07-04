class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :catalog
      t.integer :status

      t.timestamps
    end
  end
end
