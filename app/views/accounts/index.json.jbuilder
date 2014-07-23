json.array!(@accounts) do |account|
  json.extract! account, :id, :partner_id, :current_balance
  json.url account_url(account, format: :json)
end
