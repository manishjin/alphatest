class AddChatIdToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :Chat_ID, :string
  end
end
