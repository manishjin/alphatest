class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :Name
      t.text :Address
      t.string :NIF
      t.string :CreatedBy
      t.string :UpdatedBy

      t.timestamps null: false
    end
  end
end
