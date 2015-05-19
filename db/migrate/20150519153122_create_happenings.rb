class CreateHappenings < ActiveRecord::Migration
  def change
    create_table :happenings do |t|
      t.belongs_to :occasion, index: true
      t.belongs_to :user, index: true
    end
  end
end
