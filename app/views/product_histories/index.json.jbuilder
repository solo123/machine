json.array!(@product_histories) do |product_history|
  json.extract! product_history, :id, :product_id, :godown_entry_id, :godown_entry_id, :order_id, :before_items, :change_items, :now_items, :employee_id
  json.url product_history_url(product_history, format: :json)
end
