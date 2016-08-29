json.extract! enquiry, :id, :Name, :Email, :Telephone, :Message, :created_at, :updated_at
json.url enquiry_url(enquiry, format: :json)