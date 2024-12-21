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

ActiveRecord::Schema[8.0].define(version: 2024_12_20_170457) do
  create_table "bookings", force: :cascade do |t|
    t.integer "space_id"
    t.integer "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "status"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_bookings_on_space_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "objects", force: :cascade do |t|
    t.integer "space_id"
    t.float "x"
    t.float "y"
    t.float "size_x"
    t.float "size_y"
    t.float "angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_objects_on_space_id"
  end

  create_table "space_objects", force: :cascade do |t|
    t.integer "space_id"
    t.float "x"
    t.float "y"
    t.float "size_x"
    t.float "size_y"
    t.float "angle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_space_objects_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_spaces_on_creator_id"
  end

  create_table "spots", force: :cascade do |t|
    t.integer "space_id"
    t.float "x"
    t.float "y"
    t.integer "size"
    t.integer "num"
    t.decimal "price", precision: 10, scale: 2
    t.integer "time"
    t.string "time_measure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_spots_on_space_id"
  end

  create_table "spots_bookings", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_spots_bookings_on_booking_id"
    t.index ["spot_id"], name: "index_spots_bookings_on_spot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "password"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "spaces"
  add_foreign_key "bookings", "users"
  add_foreign_key "objects", "spaces"
  add_foreign_key "space_objects", "spaces"
  add_foreign_key "spaces", "users", column: "creator_id"
  add_foreign_key "spots", "spaces"
  add_foreign_key "spots_bookings", "bookings"
  add_foreign_key "spots_bookings", "spots"
end
