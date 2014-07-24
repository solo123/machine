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

    assert order.valid_for_order
    assert order.delivery
    acc = order.partner.account
    assert_equal 1, order.status
    assert_equal 200, acc.balance 

    assert order.pay(100)
    assert_equal 100, acc.balance
  end
end
