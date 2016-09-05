module CompaniesHelper
	def tablereport(driverid, companyid)
		@reporttable = Shipment.where("company_id =#{companyid} and driver_id = #{driverid}")
	end
end
#http://stackoverflow.com/questions/3902432/rails-and-heroku-pgerror-column-does-not-exist