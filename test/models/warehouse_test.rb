require 'test_helper'

class WarehouseTest < ActiveSupport::TestCase
  def pre_entry1
    warehouse = warehouses(:one)
    product = products(:one)
    godown = GodownEntry.new
    godown.godown_number = 'GD_001'
    godown.product = product
    godown.warehouse = warehouse

    item = godown.godown_items.build
    item.product = product
    item.terminal_code = 't_001'
    item.model = 'model_001'
    item.sn_code = 'sn_001'
    item.save
    godown.save
    godown.recaculate
    godown
  end
  def pre_entry2
    warehouse = warehouses(:one)
    product = products(:one)
    godown = GodownEntry.new
    godown.godown_number = 'GD_002'
    godown.product = product
    godown.warehouse = warehouse

    item = godown.godown_items.build
    item.product = product
    item.terminal_code = 't_002'
    item.model = 'model_002'
    item.sn_code = 'sn_002'
    godown.save
    godown.recaculate
    godown
  end

  test "godown to warehouse" do
    godown = pre_entry1
    warehouse = godown.warehouse
    product = godown.product

    assert_equal 0, ProductsWarehouses.current_items(warehouse, product), 'empty warehouse'
    assert godown.do_godown, 'godown for entry1: ' + godown.errors.full_messages.to_sentence
    assert_equal 1, ProductsWarehouses.current_items(warehouse, product), '1 item godown'


    godown = pre_entry2
    assert godown.do_godown, 'godown for entry2: ' + godown.errors.full_messages.to_sentence
    assert_equal 2, ProductsWarehouses.current_items(warehouse, product), '2 item godown'


  end
end
