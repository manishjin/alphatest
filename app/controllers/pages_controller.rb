class PagesController < ApplicationController
  def home
  	@enquiry=Enquiry.new
  end

  def about
  end

  def contact
  end

  def shipments
  end
end
