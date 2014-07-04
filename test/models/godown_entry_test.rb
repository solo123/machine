require 'test_helper'

class GodownEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "new godown entry" do
    godown = GodownEntry.new
    godown.godown_number = 'godown_001'
    godown.import_text = %(
model_1\tt_001\tsn_001\t123.45\t0
model_2\tt_002\tsn_002\t9.99\t2
>)    

    assert_not godown.import, 'no product'
    godown.product_id = 1
    assert godown.import
    assert_equal 123.45 + 9.99 * 2, godown.total_amount, 'total_amount'
    assert_equal 2, godown.total_items, 'total_items'
  end

  test "validate for godown" do
    godown = GodownEntry.new
    godown.godown_number = 'godown_001'
    godown.product_id = 1
    godown.import_text = %(
model_1\tt_001\tsn_001\t123.45\t0
model_2\tt_002\tsn_002\t9.99\t2
>)    
    assert godown.import

    gd = GodownEntry.new
    gd.godown_number = 'godown_001'
    gd.product_id = 1
    gd.save

    assert_not gd.valid_for_godown, 'duplicate godown_number'
    gd.godown_number = 'godown_002'
    gd.save

    assert_not gd.valid_for_godown, 'no godown items'

    gd.import_text = %(
model_1\tt_001\tsn_001\t123.45\t0
model_2\tt_002\tsn_002\t9.99\t2
>)    
    assert gd.import


  end
end
