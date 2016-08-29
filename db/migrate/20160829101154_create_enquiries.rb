class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :Name
      t.string :Email
      t.integer :Telephone
      t.text :Message

      t.timestamps null: false
    end
  end
end
