json.array!(@payments) do |payment|
  json.extract! payment, :id, :partner_id, :account_id, :amount, :notes
  json.url payment_url(payment, format: :json)
end
