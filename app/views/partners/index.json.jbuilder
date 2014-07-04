json.array!(@partners) do |partner|
  json.extract! partner, :id, :company_name, :contact, :tel, :email, :qq, :status
  json.url partner_url(partner, format: :json)
end
