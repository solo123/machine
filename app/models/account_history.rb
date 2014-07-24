class AccountHistory < ActiveRecord::Base
  belongs_to :account
  belongs_to :order_payment
  belongs_to :order
end
