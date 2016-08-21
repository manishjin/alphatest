class Shipment < ActiveRecord::Base
  belongs_to :company
  has_one :allocation
end
