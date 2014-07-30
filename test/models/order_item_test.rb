require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test 'recaculate order item' do
    product = products(:one)
    item = godown_items(:one)
    item.product = product

    oi = OrderItem.new
    oi.godown_item = item
    assert oi.recaculate

    price = product.sale_price

    assert_equal 1, oi.items
    assert_equal price, oi.price
    assert_equal price, oi.amount
  end

  test 'recaculate only with t_code' do
    godown_item = godown_items(:gd_100)
    item = OrderItem.new
    item.t_code = godown_item.terminal_code
    item.save

    item.recaculate
    assert_equal 100, item.godown_item_id
    assert_equal 100, item.product_id
    assert_equal 100, item.price
  end
end
