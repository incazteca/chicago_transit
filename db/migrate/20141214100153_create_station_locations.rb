class CreateStationLocations < ActiveRecord::Migration
  def change
    create_table :station_locations do |t|
      t.string :latitude
      t.string :longitude
    end
  end
end
