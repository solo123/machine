require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "valid stock in" do
    order = Order.new
    order.provider = providers(:one)
    order.order_date = Date.new
    order.order_number = 'order_0123'
    order.total_items = 100
    order.total_amount = 999
    oi = order.order_items.build
    oi.t_code = 't_code1'
    oi.model = 'model1'
    oi.sn_code = 'sn_code1'
    oi.price = '9.99'
    oi.status = 0
    order.save
    assert order.valid_for_stock_in
    assert order.stock_in, 'stock_in'
    assert_equal 1, order.total_items, 'total_items'
    assert_equal 9.99, order.total_amount, 'total_amount'
    assert_equal 1, order.status, 'status'
  end
  
  test "invalid stock in for no provider" do
    order = Order.new
    #order.provider = providers(:one)
    order.order_date = Date.new
    order.order_number = 'order_0123'
    oi = order.order_items.build
    oi.t_code = 't_code1'
    oi.model = 'model1'
    oi.sn_code = 'sn_code1'
    oi.price = '9.99'
    oi.status = 0
    order.save
    assert_not order.valid_for_stock_in
  end
  test "invalid stock in for no order_number" do
    order = Order.new
    order.provider = providers(:one)
    order.order_date = Date.new
    #order.order_number = 'order_0123'
    oi = order.order_items.build
    oi.t_code = 't_code1'
    oi.model = 'model1'
    oi.sn_code = 'sn_code1'
    oi.price = '9.99'
    oi.status = 0
    order.save
    assert_not order.valid_for_stock_in
  end
  test "invalid stock in for no order_date" do
    order = Order.new
    order.provider = providers(:one)
    #order.order_date = Date.new
    order.order_number = 'order_0123'
    oi = order.order_items.build
    oi.t_code = 't_code1'
    oi.model = 'model1'
    oi.sn_code = 'sn_code1'
    oi.price = '9.99'
    oi.status = 0
    order.save
    assert_not order.valid_for_stock_in
  end
  test "invalid stock in for no order items" do
    order = Order.new
    order.provider = providers(:one)
    order.order_date = Date.new
    order.order_number = 'order_0123'
    order.save
    assert_not order.valid_for_stock_in
  end
end
