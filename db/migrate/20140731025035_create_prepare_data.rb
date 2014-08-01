class CreatePrepareData < ActiveRecord::Migration
  def change
    create_table :prepare_data do |t|
      t.string :c0
      t.string :c1
      t.string :c2
      t.string :c3
      t.string :c4
      t.string :c5
      t.string :c6
      t.string :c7
      t.string :c8
      t.string :c9
      t.integer :usage
      t.integer :status

      t.timestamps
    end
  end
end
