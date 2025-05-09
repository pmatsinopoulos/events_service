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

ActiveRecord::Schema[8.0].define(version: 2025_05_08_093556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "event_type", null: false
    t.string "name", null: false
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.float "longitude"
    t.float "latitude"
    t.string "address"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_events_on_name"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_type", null: false
    t.index ["event_type"], name: "index_subscriptions_on_event_type"
    t.index ["name"], name: "index_subscriptions_on_name", unique: true
  end

  create_table "travellers", force: :cascade do |t|
    t.string "mobile", null: false
    t.string "event_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile", "event_type"], name: "index_travellers_on_mobile_and_event_type", unique: true
    t.index ["mobile"], name: "index_travellers_on_mobile"
  end
end
