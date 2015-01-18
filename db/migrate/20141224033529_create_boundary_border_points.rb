class CreateBoundaryBorderPoints < ActiveRecord::Migration
  def change
    create_table :boundary_border_points do |t|
      t.integer :location_boundary_id
      t.string :latitude
      t.string :longitude
    end
  end
end
