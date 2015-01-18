class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :name
      t.string :author
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
