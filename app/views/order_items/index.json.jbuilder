json.array!(@order_items) do |order_item|
  json.extract! order_item, :id, :order_id, :t_code, :model, :sn_code, :price, :mobile_number, :status
  json.url order_item_url(order_item, format: :json)
end
