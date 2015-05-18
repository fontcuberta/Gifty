class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :description
      t.timestamps null: false
    end
  end
end
