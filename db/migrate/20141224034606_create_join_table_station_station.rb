class CreateJoinTableStationStation < ActiveRecord::Migration
  def change
    create_join_table :stations, :stations do |t|
       t.index [:station_id, :station_id]
       t.index [:station_id, :station_id]
    end
  end
end
