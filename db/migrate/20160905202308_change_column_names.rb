class ChangeColumnNames < ActiveRecord::Migration
  def change
  	rename_column :shipments, :Driver_ID, :driver_id
  end
end
