class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :godown_item

  def recaculate
    unless self.godown_item
      if self.t_code
        self.godown_item = GodownItem.find_by_terminal_code(self.t_code)
      end
    end
    if self.godown_item && self.godown_item.product
      price = self.godown_item.product.sale_price

      self.product = self.godown_item.product
      self.price = price
      self.items = 1 unless self.items
      self.amount = price * self.items
      self.save
    end
    true
  end

  def delivery
    return false unless self.status == 0 && self.godown_item && self.godown_item.status == 1
    recaculate
    item.status = 1
    item.save
    item.godown_item.status = 2
    item.godown_item.save


  end

end
