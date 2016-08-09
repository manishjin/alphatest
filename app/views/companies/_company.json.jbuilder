json.extract! company, :id, :Name, :Address, :NIF, :CreatedBy, :UpdatedBy, :created_at, :updated_at
json.url company_url(company, format: :json)