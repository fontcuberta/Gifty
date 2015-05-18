class AddOccasionIdToGift < ActiveRecord::Migration
  def change
  	add_column :gifts, :occasion_id, :integer
  end
end
