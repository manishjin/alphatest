class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.text :Name
      t.text :Address
      t.string :Type
      t.text :Billing_Address
      t.string :NIF
      t.boolean :Verified
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
