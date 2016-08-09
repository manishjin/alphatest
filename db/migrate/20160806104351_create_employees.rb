class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :First_Name
      t.string :Last_Name
      t.integer :Telephone
      t.string :Email
      t.string :Designation
      t.string :Social_Sec
      t.string :Country
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
