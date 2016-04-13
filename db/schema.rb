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

ActiveRecord::Schema.define(version: 20160413114831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "climate_logs", force: :cascade do |t|
    t.integer  "climate_sensor_id"
    t.datetime "datetime"
    t.float    "temp"
    t.float    "humidity"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "climate_logs", ["climate_sensor_id"], name: "index_climate_logs_on_climate_sensor_id", using: :btree

  create_table "climate_sensors", force: :cascade do |t|
    t.integer  "raspberry_id"
    t.string   "name"
    t.string   "model"
    t.integer  "port_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "climate_sensors", ["raspberry_id"], name: "index_climate_sensors_on_raspberry_id", using: :btree

  create_table "raspberries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "address"
    t.string   "port"
    t.string   "revision"
    t.string   "serial"
    t.text     "settings"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "name"
    t.string   "encrypted_secret"
    t.string   "encrypted_secret_iv"
  end

  add_index "raspberries", ["user_id"], name: "index_raspberries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "uid"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "climate_logs", "climate_sensors"
  add_foreign_key "climate_sensors", "raspberries"
  add_foreign_key "raspberries", "users"
end
