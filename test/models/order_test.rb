require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "valid for order" do
    order = Order.new
    assert_not order.valid_for_order, 'valid for empty order'

    order.partner = partners(:one)
    assert_not order.valid_for_order, 'valid for not items'
    
    oi = order.order_items.build
    oi.product = products(:one)
    oi.save
    order.save
    order.recaculate
    assert order.valid_for_order, 'full order'
  end

  test 'recaculate order' do
    godown = godown_items(:one)
    product = products(:one)
    godown.product = product
    godown.status = 1
    godown.save

    order = Order.new
    oi = order.order_items.build
    oi.godown_item = godown
    assert order.save, 'save order error'

    assert order.recaculate, 'recaculate false'
    assert_equal product.sale_price, order.total_amount
    assert_equal 1, order.total_items
  end
  
end
