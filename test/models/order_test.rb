require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def order1
    product = products(:one)
    godown = godown_items(:one)
    godown.product = product
    partner = partners(:one)

    order = Order.new
    order.partner = partner
    oi = order.order_items.build
    oi.godown_item = godown
    order
  end
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
    product = products(:one)
    order = order1
    assert order.save, 'save order error'
    assert order.recaculate, 'recaculate false'
    #binding.pry
    assert_equal product.sale_price, order.total_amount
    assert_equal 1, order.total_items
  end

  test 'import' do
    import_text = %(
ord001\t20140601\tt0001\t张三\tabc
\t20140602\tt0002\t张三\t
    )
    assert Order.import(import_text)
    ord1 = Order.find_by_order_number('ord001')
    assert_equal 't0001', ord1.order_items.first.t_code
    
  end
end
