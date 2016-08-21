class AddAllocationDetailsToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :Allocated_Truck_Type, :string
    add_column :shipments, :Assigned_To, :string
    add_column :shipments, :Allocated_Company_ID, :string
    add_column :shipments, :Driver_ID, :string
    add_column :shipments, :Allocated_Contact_Person, :string
    add_column :shipments, :Allocated_Contact_No, :integer
    add_column :shipments, :Allocation_Date, :date
    add_column :shipments, :Allocated_By, :string
    add_column :shipments, :Chat_ID, :string
    add_column :shipments, :Chat_Message, :text
  end
end
