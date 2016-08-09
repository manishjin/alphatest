class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.boolean :Sub_Shipment
      t.integer :Parent_Shipment_ID
      t.string :Status
      t.integer :Client_ID
      t.text :Client_Name
      t.text :Pickup_Location
      t.date :Pickup_Date
      t.time :Pickup_Start_Time
      t.time :Pickup_End_Time
      t.integer :Pickup_Gate
      t.string :Pickup_Contact_Person
      t.integer :Pickup_Contact_No
      t.integer :Weight
      t.boolean :Palletized
      t.integer :No_of_Pallets
      t.text :Dropoff_Location
      t.date :Dropoff_Date
      t.time :Dropoff_Start_Time
      t.time :Dropff_End_Time
      t.integer :Dropoff_Gate
      t.string :Dropoff_Contact_Person
      t.integer :Dropff_Contact_No
      t.text :Comments
      t.text :Cargo_Type
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
