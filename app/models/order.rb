class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :order_payments, dependent: :destroy

  belongs_to :partner

  attr_accessor :foo

  def valid_for_order
    return false unless (self.status == 0) && self.partner && (self.total_items > 0) && (self.order_items.count > 0)
    true
  end
  def valid_for_pay
    return false unless (self.status == 1 || self.status == 2)
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
    p = self.partner
    if p
      p.account = p.build_account unless p.account
      p.account.add(self.total_amount, self)
    end
    self.save

  end
  def pay(amount)
    return false unless valid_for_pay
    p = self.order_payments.build
    p.balance_before = self.balance
    p.pay_amount = amount
    self.balance = p.balance = p.balance_before - amount
    p.save
    self.partner.account.add(-amount, self, p) if self.partner && self.partner.account
    self.status = 2 if self.status = 1
    self.status = 3 if self.balance == 0
    self.save
  end
end
