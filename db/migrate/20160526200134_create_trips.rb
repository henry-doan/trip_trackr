class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.string :info
      t.string :date
      t.has_many :location

      t.timestamps null: false
    end
  end
end
