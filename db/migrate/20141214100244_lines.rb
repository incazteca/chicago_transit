class Lines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :line_name
      t.integer :train_freq_in_minutes
      t.string :start_hour
      t.string :end_hour
    end
  end
end
