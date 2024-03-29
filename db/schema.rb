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

ActiveRecord::Schema.define(version: 2018_06_06_165803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.bigint "user_id"
    t.bigint "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_bookings_on_device_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "disabled", default: false, null: false
    t.index ["lab_id"], name: "index_devices_on_lab_id"
  end

  create_table "invite_codes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lab_id"
    t.integer "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_invite_codes_on_code", unique: true
    t.index ["lab_id"], name: "index_invite_codes_on_lab_id"
    t.index ["user_id"], name: "index_invite_codes_on_user_id"
  end

  create_table "labs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "institute"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "invited_by_user_id"
    t.bigint "lab_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.boolean "admin", default: false, null: false
    t.string "api_key"
    t.index ["api_key"], name: "index_users_on_api_key", unique: true
    t.index ["lab_id"], name: "index_users_on_lab_id"
  end

  add_foreign_key "bookings", "devices"
  add_foreign_key "bookings", "users"
  add_foreign_key "devices", "labs"
  add_foreign_key "invite_codes", "labs"
  add_foreign_key "invite_codes", "users"
  add_foreign_key "users", "labs"
end
