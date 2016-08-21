class AddChatIdToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :Chat_ID, :string
  end
end
