json.extract! employee, :id, :First_Name, :Last_Name, :Telephone, :Email, :Designation, :Social_Sec, :Country, :company_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)