class AddFurtherDetailsToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :Volume, :string
    add_column :shipments, :OtherClient, :boolean
    add_column :shipments, :OtherDriver, :boolean
    add_column :shipments, :Driver_Name, :string
  end
end
