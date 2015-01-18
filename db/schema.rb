# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141224034606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boundary_border_points", force: true do |t|
    t.integer "location_boundary_id"
    t.string  "latitude"
    t.string  "longitude"
  end

  create_table "lines", force: true do |t|
    t.string  "line_name"
    t.integer "train_freq_in_minutes"
    t.string  "start_hour"
    t.string  "end_hour"
  end

  create_table "location_boundaries", force: true do |t|
    t.string "name"
  end

  create_table "maps", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.string   "created_by"
    t.string   "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "station_locations", force: true do |t|
    t.string "latitude"
    t.string "longitude"
  end

  create_table "stations", force: true do |t|
    t.string  "name"
    t.integer "station_location_id"
  end

  create_table "stations_stations", id: false, force: true do |t|
    t.integer "station_id", null: false
  end

  add_index "stations_stations", ["station_id", "station_id"], name: "index_stations_stations_on_station_id_and_station_id", using: :btree

end
