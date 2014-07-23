json.array!(@order_payments) do |order_payment|
  json.extract! order_payment, :id, :order_id, :balance_before, :pay_amount, :balance
  json.url order_payment_url(order_payment, format: :json)
end
