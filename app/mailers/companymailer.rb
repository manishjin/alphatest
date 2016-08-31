class Companymailer < ApplicationMailer
	def contactemail(enquiry)
		@enquiry = enquiry
		mail(to: "info@trans-wiz.com", subject: "New Enquiry")
	end
end
