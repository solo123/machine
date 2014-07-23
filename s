
[1mFrom:[0m /home/jimmy/work/machine/test/models/warehouse_test.rb @ line 50 WarehouseTest#test_godown_to_warehouse:

    40: test [31m[1;31m"[0m[31mgodown to warehouse[1;31m"[0m[31m[0m [32mdo[0m
    41:   godown = pre_entry1
    42:   warehouse = godown.warehouse
    43:   product = godown.product
    44: 
    45:   assert_equal [1;34m0[0m, [1;34;4mProductsWarehouses[0m.current_items(warehouse, product), [31m[1;31m'[0m[31mempty warehouse[1;31m'[0m[31m[0m
    46:   assert godown.do_godown, [31m[1;31m'[0m[31mgodown for entry1: [1;31m'[0m[31m[0m + godown.errors.full_messages.to_sentence
    47:   assert_equal [1;34m1[0m, [1;34;4mProductsWarehouses[0m.current_items(warehouse, product), [31m[1;31m'[0m[31m1 item godown[1;31m'[0m[31m[0m
    48: 
    49: 
 => 50:   binding.pry
    51:   godown = pre_entry2
    52:   assert godown.do_godown, [31m[1;31m'[0m[31mgodown for entry2: [1;31m'[0m[31m[0m + godown.errors.full_messages.to_sentence
    53:   assert_equal [1;34m2[0m, [1;34;4mProductsWarehouses[0m.current_items(warehouse, product), [31m[1;31m'[0m[31m2 item godown[1;31m'[0m[31m[0m
    54: 
    55: 
    56: [32mend[0m

