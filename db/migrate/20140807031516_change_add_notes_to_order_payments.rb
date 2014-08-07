class ChangeAddNotesToOrderPayments < ActiveRecord::Migration
  def change
    change_table :order_payments do |t|
      t.string :notes
      t.integer :status, default: 0
    end
  end
end
