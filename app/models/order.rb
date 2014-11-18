class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :order_payments, dependent: :destroy

  belongs_to :partner
  default_scope { order('id desc')}

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
  def pay(amount, notes = nil)
    return false unless valid_for_pay
    p = self.order_payments.build
    p.balance_before = self.balance
    p.pay_amount = amount
    p.notes = notes
    self.balance = p.balance = p.balance_before - amount
    p.save
    self.partner.account.add(-amount, self, p) if self.partner && self.partner.account
    self.status = 2 if self.status = 1
    self.status = 3 if self.balance == 0
    self.save
  end
  def self.import(import_text)
    # 订单号，日期，串码，合作伙伴，备注
    import_text.split(/\n/).each do |line|
      cs = line.split(/[\t]/)
      if cs.length > 3
        order_number = cs[0]
        order_number = DateTime.now.to_id unless cs[0]

        order = Order.find_or_create_by(order_number: order_number)
        order.order_date = cs[1].to_date
        if cs[3] && !cs[3].blank?
          order.partner = Partner.find_or_create_by(partner_name: cs[3])
        end
        item = order.order_items.build
        item.t_code = cs[2]
        item.notes = cs[4] if cs.length > 4
        order.save
      end
    end
    true
  end
end
