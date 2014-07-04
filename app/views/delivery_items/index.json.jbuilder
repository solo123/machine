json.array!(@delivery_items) do |delivery_item|
  json.extract! delivery_item, :id, :delivery_id, :t_code, :item_name, :items, :price, :amount, :status
  json.url delivery_item_url(delivery_item, format: :json)
end
