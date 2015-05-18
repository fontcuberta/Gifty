class AddExpiryDateToOccasion < ActiveRecord::Migration
  def change
   	add_column :occasions, :expiry_date, :datetime
  end
end