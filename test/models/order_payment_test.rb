require 'test_helper'

class OrderPaymentTest < ActiveSupport::TestCase
  test "order payment" do   
    order = orders(:order_100)
    assert_equal 1, order.status
    assert_equal 100, order.balance
  end
end
