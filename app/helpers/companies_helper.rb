module CompaniesHelper
	def tablereport(driverid, companyid)
		@reporttable = Shipment.where("company_id =#{companyid} and Driver_ID = #{driverid}")
	end
end
