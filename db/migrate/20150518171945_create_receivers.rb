class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.timestamps null: false
      t.belongs_to :occasion, index: true
    end
  end
end
