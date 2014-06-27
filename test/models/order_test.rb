require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "valid for stock in" do
    order = Order.new
    order.save
    assert_not order.valid_for_stock_in 

    order.provider = providers(:one)
    order.order_date = Date.new
    order.order_number = 'order_0123'
    order.save
    assert order.valid_for_stock_in
  end
end
