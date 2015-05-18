class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
    	t.string :description
    	t.integer :price
    	t.string :store
    	t.string :url
      t.timestamps null: false
    end
  end
end
