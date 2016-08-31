class PagesController < ApplicationController
  def home
  	@enquiry=Enquiry.new
  	
  	if user_signed_in?
  		@company = Company.find_by_user_id(current_user.id)
  	end

  end

  def about
  end

  def contact
  end

  def shipments
  end
end
