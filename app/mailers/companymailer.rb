class Companymailer < ApplicationMailer
	default from: "trufertrucks@gmail.com"

	def contactemail
		mail(to: "info@trans-wiz.com", subject: "test subject")
	end
end
