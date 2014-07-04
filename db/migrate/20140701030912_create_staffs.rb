class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.string :tel
      t.string :email
      t.string :position
      t.string :qq
      t.integer :company_id

      t.timestamps
    end
  end
end
