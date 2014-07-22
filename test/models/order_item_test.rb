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
end
