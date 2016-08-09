class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :First_Name
      t.string :Last_Name
      t.integer :Telephone
      t.string :Email
      t.string :Truck_No
      t.string :Social_Sec
      t.boolean :Verified
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
