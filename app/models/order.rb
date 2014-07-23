class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  belongs_to :partner

  attr_accessor :foo

  def valid_for_order
    return false unless (self.status == 0) && self.partner && (self.total_items > 0) && (self.order_items.count > 0)
    true
  end
  def recaculate
    return false unless self.status == 0
    self.order_items.each { |item| item.recaculate }
    self.total_items = self.order_items.count
    self.total_amount = self.order_items.sum(:amount)
    self.save
  end
  def delivery
    return false unless valid_for_order
    recaculate

    self.order_items.each do |item| 
      if item.status == 1
        ProductsWarehouses.add(item.warehouse, item.product, -1, self)
        item.status = 2
        item.save
      end
    end
    self.status = 1
    self.save
  end
end
