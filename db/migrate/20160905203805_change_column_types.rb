class ChangeColumnTypes < ActiveRecord::Migration
  def change
  	change_column :shipments, :driver_id, 'integer USING CAST(driver_id AS integer)'
  end
end
