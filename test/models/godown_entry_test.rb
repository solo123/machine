require 'test_helper'

class GodownEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "new godown entry" do
    godown = GodownEntry.new
    godown.godown_number = 'godown_001'
    godown.import_text = %(
PROD 1\ttm_01\t100
PROD 2\ttm_02\t200
    )

    assert_difference('OrderImport.count', 2) do
      godown.save
    end
    assert_equal nil, godown.import_text
  end

  test 'import' do
    godown = GodownEntry.new
    godown.godown_number = 'godown_001'
    godown.import_text = %(
PROD 1\ttm_01\t100
PROD 2\ttm_02\t200
PROD 1\ttm_03\t100
    )

    assert_difference('OrderImport.count', 3) do
      godown.save
    end

    assert_difference('GodownItem.count', 3) do
      godown.do_import
    end
    godown.recaculate

    assert_equal 0, OrderImport.count
    assert_equal 400, godown.total_amount
    assert_equal 3, godown.total_items


  end
end
