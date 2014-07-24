class Account < ActiveRecord::Base
  belongs_to :partner
  has_many :account_histories

  def add(amount, order, order_payment = nil)
    h = self.account_histories.build
    h.balance_before = self.balance
    h.amount = amount
    self.balance += amount
    h.balance = self.balance
    h.order = order
    h.order_payment = order_payment
    h.save
    self.save
  end
end
