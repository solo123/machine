require 'test_helper'

class PrepareDataTest < ActiveSupport::TestCase
  test 'import data' do
    import_text = %(
d1\t\td2\t
f1\tf2
    )

    assert_difference('PrepareData.count', 4) do
      PrepareData.import(import_text, 1)
    end
    assert d = PrepareData.find_by_c0("f1")
    assert_equal "f2",  d.c1
  end

end
