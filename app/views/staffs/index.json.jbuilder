json.array!(@staffs) do |staff|
  json.extract! staff, :id, :name, :tel, :email, :position, :qq, :company_id
  json.url staff_url(staff, format: :json)
end
