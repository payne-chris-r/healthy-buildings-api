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

ActiveRecord::Schema.define(version: 20160630162734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "baselines", force: :cascade do |t|
    t.boolean  "certified"
    t.integer  "building_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "baselines", ["building_id"], name: "index_baselines_on_building_id", using: :btree

  create_table "buildings", force: :cascade do |t|
    t.integer  "BID"
    t.text     "name"
    t.text     "address"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.float    "lat"
    t.float    "long"
    t.integer  "sq_ft"
    t.integer  "year_const"
    t.integer  "num_floors"
    t.text     "notes"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buildings", ["user_id"], name: "index_buildings_on_user_id", using: :btree

  create_table "certifications", force: :cascade do |t|
    t.text     "leedversion"
    t.text     "rating"
    t.text     "category"
    t.text     "credits"
    t.text     "label"
    t.text     "obtained"
    t.integer  "building_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "certifications", ["building_id"], name: "index_certifications_on_building_id", using: :btree

  create_table "days", force: :cascade do |t|
    t.integer  "day"
    t.date     "date"
    t.float    "enhanced_iaq"
    t.float    "tc"
    t.float    "iaq_perf"
    t.float    "low_emit_air"
    t.float    "iaq_assess"
    t.float    "acoustic"
    t.float    "low_emit_dirt"
    t.float    "green_clean"
    t.float    "ipm"
    t.float    "int_lighting"
    t.float    "daylight"
    t.float    "views"
    t.float    "mold"
    t.float    "ets"
    t.float    "surveys"
    t.float    "baseline"
    t.float    "aer_score"
    t.float    "tc_score"
    t.float    "humidity_score"
    t.float    "noise_score"
    t.float    "steps_score"
    t.float    "sleep_score"
    t.float    "rt_score"
    t.float    "overall_score"
    t.float    "co2"
    t.float    "aer"
    t.float    "temp"
    t.float    "rh"
    t.float    "sh"
    t.float    "noise"
    t.float    "pmv"
    t.float    "ppd"
    t.float    "steps"
    t.float    "sleep"
    t.integer  "num_sensors"
    t.integer  "building_id",    null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "days", ["building_id"], name: "index_days_on_building_id", using: :btree

  create_table "details", force: :cascade do |t|
    t.integer  "pid"
    t.integer  "day"
    t.date     "date"
    t.float    "co2"
    t.float    "aer"
    t.float    "temp"
    t.float    "rh"
    t.float    "sh"
    t.float    "noise"
    t.float    "pmv"
    t.float    "ppd"
    t.integer  "building_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "details", ["building_id"], name: "index_details_on_building_id", using: :btree

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "examples", ["user_id"], name: "index_examples_on_user_id", using: :btree

  create_table "frameworks", force: :cascade do |t|
    t.text     "name"
    t.text     "cat"
    t.text     "foundation"
    t.text     "phase"
    t.float    "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measures", force: :cascade do |t|
    t.float    "score"
    t.float    "value"
    t.integer  "building_id",  null: false
    t.integer  "framework_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "measures", ["building_id"], name: "index_measures_on_building_id", using: :btree
  add_index "measures", ["framework_id"], name: "index_measures_on_framework_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.datetime "datetime"
    t.float    "temp"
    t.float    "humidity"
    t.float    "co2"
    t.float    "noise"
    t.float    "pressure"
    t.float    "ppd"
    t.float    "humidity_score"
    t.float    "noise_score"
    t.float    "co2_score"
    t.float    "tc_score"
    t.integer  "sensor_id",      null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "points", ["sensor_id"], name: "index_points_on_sensor_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.boolean  "admin_rights", default: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "sensors", force: :cascade do |t|
    t.integer  "floor"
    t.integer  "PID"
    t.integer  "building_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sensors", ["building_id"], name: "index_sensors_on_building_id", using: :btree

  create_table "thermals", force: :cascade do |t|
    t.integer  "cat"
    t.integer  "group"
    t.float    "temp"
    t.float    "hum"
    t.integer  "building_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "thermals", ["building_id"], name: "index_thermals_on_building_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree

  add_foreign_key "baselines", "buildings"
  add_foreign_key "buildings", "users"
  add_foreign_key "certifications", "buildings"
  add_foreign_key "days", "buildings"
  add_foreign_key "details", "buildings"
  add_foreign_key "examples", "users"
  add_foreign_key "measures", "buildings"
  add_foreign_key "measures", "frameworks"
  add_foreign_key "points", "sensors"
  add_foreign_key "profiles", "users"
  add_foreign_key "sensors", "buildings"
  add_foreign_key "thermals", "buildings"
end
