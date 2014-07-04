class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :provider

  scope :in_stock, -> {where(status: 1)}
  scope :out_stock, -> {where('status > 1')}
end
