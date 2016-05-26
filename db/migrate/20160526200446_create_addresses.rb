class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country, null: false
      t.string :city, null :false
      t.belongs_to :location

      t.timestamps null: false
    end
  end
end
