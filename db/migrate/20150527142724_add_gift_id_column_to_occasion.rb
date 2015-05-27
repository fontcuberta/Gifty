class AddGiftIdColumnToOccasion < ActiveRecord::Migration
  def change
    add_column :occasions, :gift_id, :integer
    remove_column :gifts, :occasion_id
  end
end
