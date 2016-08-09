json.extract! client, :id, :Name, :Address, :Type, :Billing_Address, :NIF, :Verified, :company_id, :created_at, :updated_at
json.url client_url(client, format: :json)