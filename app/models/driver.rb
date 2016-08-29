class Driver < ActiveRecord::Base
  belongs_to :company

  def full_name
    "#{self.First_Name} #{self.Last_Name}"
  end

end
