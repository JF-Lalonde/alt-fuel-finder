class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :name
      t.string :address
      t.string :fuel_types
      t.integer :distance
      t.string :access_time

      t.timestamps null: false
    end
  end
end
