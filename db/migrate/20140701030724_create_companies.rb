class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :manager
      t.string :tel
      t.string :email
      t.string :qq
      t.integer :status

      t.timestamps
    end
  end
end
