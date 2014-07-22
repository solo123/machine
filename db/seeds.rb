Employee.create!([
  {email: "solo123@21cn.com", password: 'liang123', password_confirmation: 'liang123' }
])
GodownEntry.create!([
  {godown_number: "GD001", product_id: 1, warehouse_id: 1, total_items: 5, total_amount: "3000.0", status: 0, creator_id: 1}
])
GodownItem.create!([
  {godown_entry_id: 1, product_id: 1, terminal_code: "01028974", model: "NL8080YM", sn_code: "A001000600296054", price: "600.0", items: 1, amount: "600.0", status: 0},
  {godown_entry_id: 1, product_id: 1, terminal_code: "01028975", model: "NL8080YM", sn_code: "A001000600296055", price: "600.0", items: 1, amount: "600.0", status: 0},
  {godown_entry_id: 1, product_id: 1, terminal_code: "01028976", model: "NL8080YM", sn_code: "A001000600296056", price: "600.0", items: 1, amount: "600.0", status: 0},
  {godown_entry_id: 1, product_id: 1, terminal_code: "01028977", model: "NL8080YM", sn_code: "A001000600296057", price: "600.0", items: 1, amount: "600.0", status: 0},
  {godown_entry_id: 1, product_id: 1, terminal_code: "01028978", model: "NL8080YM", sn_code: "A001000600296058", price: "600.0", items: 1, amount: "600.0", status: 0}
])
Partner.create!([
  {partner_name: "张三", contact: "张先生", tel: "13500100001", email: "abc@herer.com", qq: "10010001", status: 1},
  {partner_name: "李四", contact: "李先生", tel: "13900200002", email: "abc4@here.com", qq: "400100001", status: 1}
])
Product.create!([
  {name: "NL730G", catalog: "大POS", godown_price: nil, sale_price: nil, status: 1},
  {name: "NEW8110", catalog: "华智融", godown_price: nil, sale_price: nil, status: 1},
  {name: "K370", catalog: "大POS", godown_price: nil, sale_price: nil, status: 1},
  {name: "NL8080Y", catalog: "固定", godown_price: nil, sale_price: nil, status: 1},
  {name: "SP60G", catalog: "大POS", godown_price: nil, sale_price: nil, status: 1},
])
Warehouse.create!([
  {name: "418", status: 1}
])
