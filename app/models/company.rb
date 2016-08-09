class Company < ActiveRecord::Base
	has_many :clients
	has_many :employees
	has_many :drivers
	has_many :shipments
end
