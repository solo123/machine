require 'test_helper'

class OrderPaymentTest < ActiveSupport::TestCase
  test "order payment" do   
    order = orders(:order_100)
    assert_equal 1, order.status
    assert_equal 100, order.balance

    assert order.pay(10), 'first payment'
    assert_equal 2, order.status
    assert_equal 90, order.balance
    p = order.order_payments.first
    assert_equal 100, p.balance_before
    assert_equal 10, p.pay_amount
    assert_equal 90, p.balance
    
    assert order.pay(90), 'full payment'
    assert_equal 0, order.balance
    assert_equal 3, order.status
  end
  test "order payment and partner account" do
    order = orders(:order_200)
    order_biz = Biz::OrderBiz.new

    assert order.valid_for_order
    acc = order.partner.account
    assert_difference('acc.balance', 1200.01) do
      assert order_biz.delivery(order)
    end
    assert_equal 1, order.status
    assert_equal order.total_amount, order.balance

    assert_difference('acc.balance', -100) do
      order.pay(100, 'test 100')
    end
    assert_equal order.total_amount - 100, order.balance
    
    assert_difference('acc.balance', -200) do
      order.pay(200, 'test 200')
    end
    assert_equal order.total_amount - 300, order.balance
  end
end
