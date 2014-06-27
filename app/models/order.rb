class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :provider
  def valid_for_stock_in
    return false unless (status == 0) && provider && order_date && order_number
    true
  end
end
