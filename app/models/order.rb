class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :partner

  attr_accessor :foo
  def valid_for_stock_in
    return false unless (status == 0) && provider && order_date && order_number && (order_items.count > 0)
    true
  end
  def stock_in
    return false unless valid_for_stock_in
    amount = 0
    cnt = 0
    self.order_items.each do |item|
      if item.status == 0
        item.provider = provider
        item.status = 1
        item.save!
      end
      amount += item.price
      cnt += 1
    end
    self.total_items = cnt
    self.total_amount = amount
    self.status = 1
    self.save!
  end
end
