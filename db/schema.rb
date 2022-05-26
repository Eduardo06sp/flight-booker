# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_26_015340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.date "departure_date"
    t.time "departure_time"
    t.date "arrival_date"
    t.time "arrival_time"
    t.integer "available_seats"
    t.integer "capacity"
    t.string "flight_duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "origin_id", null: false
    t.bigint "destination_id", null: false
    t.index ["destination_id"], name: "index_flights_on_destination_id"
    t.index ["origin_id"], name: "index_flights_on_origin_id"
  end

  add_foreign_key "flights", "airports", column: "destination_id"
  add_foreign_key "flights", "airports", column: "origin_id"
end
