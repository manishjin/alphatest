module CompaniesHelper
	def tablereport(driverid, companyid)
		@reporttable = Shipment.where("company_id =#{companyid} and driver_id = #{driverid}")
	end
end
