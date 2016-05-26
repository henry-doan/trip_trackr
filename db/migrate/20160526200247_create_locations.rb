class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :place, null: false
      t.belongs_to :trip
      t.has_one :address

      t.timestamps null: false
    end
  end
end
