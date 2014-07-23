class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :partner_id
      t.decimal :current_balance, precision: 2, scale: 12, default: 0

      t.timestamps
    end
  end
end
