class CreateLocationBoundaries < ActiveRecord::Migration
  def change
    create_table :location_boundaries do |t|
      t.string :name
    end
  end
end
