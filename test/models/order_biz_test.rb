require 'test_helper'

class OrderBizTest < ActiveSupport::TestCase
  test 'order delivery' do
    order = Order.new(order_date: '20140601'.to_date, order_number: 'o_001', partner_id: 1)
    o1 = order.order_items.build(product_id: 1, godown_item_id: 1, t_code: 't_001', price: 10, items: 1, amount: 10)
    o2 = order.order_items.build(product_id: 1, godown_item_id: 1, t_code: 't_001', price: 10, items: 1, amount: 10)
    assert order.save
    assert order.recaculate
    order_biz = Biz::OrderBiz.new

    assert order_biz.delivery(order)

    assert_equal 1, order.order_items.where(status: 1).count, '1 for valid delivery'
    assert_equal 1, order.order_items.where(status: 0).count, '1 for invalid delivery'

  end
end

