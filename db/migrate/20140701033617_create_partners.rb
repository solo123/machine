class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :company_name
      t.string :contact
      t.string :tel
      t.string :email
      t.string :qq
      t.integer :status

      t.timestamps
    end
  end
end
