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

ActiveRecord::Schema[7.1].define(version: 2023_12_11_184812) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colorado_arrests", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.bigint "immate_id"
    t.text "data_source_url"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.index ["deleted"], name: "deleted"
    t.index ["immate_id"], name: "fk_il_tazewell__arrests_il_tazewell__arrestees_idx"
    t.index ["md5_hash"], name: "md5", unique: true
    t.index ["run_id"], name: "run_id"
    t.index ["touched_run_id"], name: "touched_run_id"
  end

  create_table "colorado_charges", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.bigint "arrest_id"
    t.string "number"
    t.string "disposition"
    t.date "disposition_date"
    t.string "description"
    t.string "offense_type"
    t.date "offense_date"
    t.time "offense_time"
    t.string "attempt_or_commit"
    t.string "docket_number"
    t.string "crime_class"
    t.string "acs"
    t.string "counts"
    t.text "data_source_url"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.index ["arrest_id"], name: "fk_il_tazewell__charges_il_tazewell__arrests1_idx"
    t.index ["deleted"], name: "deleted"
    t.index ["md5_hash"], name: "md5", unique: true
    t.index ["run_id"], name: "run_id"
    t.index ["touched_run_id"], name: "touched_run_id"
  end

  create_table "colorado_court_hearings", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.bigint "charge_id"
    t.string "court_name"
    t.date "court_date"
    t.time "court_time"
    t.date "next_court_date"
    t.time "next_court_time"
    t.string "case_type"
    t.string "sentence_lenght"
    t.text "data_source_url"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.index ["charge_id"], name: "fk_il_tazewell__court_hearings_il_tazewell__charges1_idx"
    t.index ["deleted"], name: "deleted"
    t.index ["md5_hash"], name: "md5", unique: true
    t.index ["run_id"], name: "run_id"
    t.index ["touched_run_id"], name: "touched_run_id"
  end

  create_table "colorado_holding_facilities", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.bigint "arrest_id"
    t.string "facility"
    t.date "planned_release_date"
    t.date "actual_release_date"
    t.text "data_source_url"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.index ["arrest_id"], name: "fk_il_tazewell__holding_facilities_il_tazewell__arrests1_idx"
    t.index ["deleted"], name: "deleted"
    t.index ["md5_hash"], name: "md5", unique: true
    t.index ["run_id"], name: "run_id"
    t.index ["touched_run_id"], name: "touched_run_id"
  end

  create_table "colorado_inmate_additional", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.bigint "immate_id"
    t.string "height"
    t.string "weight"
    t.string "hair_color"
    t.string "eye_color"
    t.integer "age"
    t.string "created_by", default: "Muhannad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.string "hair_length", limit: 45
    t.index ["immate_id"], name: "fk_immate_additional_info_immates10"
  end

  create_table "colorado_inmate_ids", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.bigint "immate_id"
    t.string "number"
    t.text "data_source_url"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.index ["deleted"], name: "deleted"
    t.index ["immate_id"], name: "fk_il_tazewell__arrestee_ids_il_tazewell__arrestees1_idx"
    t.index ["md5_hash"], name: "md5", unique: true
    t.index ["run_id"], name: "run_id"
    t.index ["touched_run_id"], name: "touched_run_id"
  end

  create_table "colorado_inmates", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.string "full_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "suffix"
    t.string "sex", limit: 5
    t.string "race"
    t.text "data_source_url"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "updated_at", precision: nil, default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.bigint "run_id"
    t.bigint "touched_run_id"
    t.boolean "deleted", default: false
    t.string "md5_hash"
    t.index ["deleted"], name: "deleted"
    t.index ["md5_hash"], name: "md5", unique: true
    t.index ["run_id"], name: "run_id"
    t.index ["touched_run_id"], name: "touched_run_id"
  end

  create_table "colorado_inmates_runs", charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", comment: "Created by Muhammad Musa, Task #746", force: :cascade do |t|
    t.string "status", default: "processing"
    t.string "created_by", default: "Muhammad Musa"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
  end

  create_table "max_data", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.string "part_number"
    t.string "marking"
    t.string "packing_pins"
    t.string "status"
    t.text "description", size: :long
    t.string "url"
    t.string "package_types"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.index ["part_number"], name: "unique_data", unique: true
  end

  create_table "ti_data", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_520_ci", force: :cascade do |t|
    t.string "part_number"
    t.string "marking"
    t.string "packing_pins", limit: 100
    t.string "status", limit: 100
    t.text "description"
    t.string "url", limit: 100
    t.string "package"
    t.datetime "created_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.timestamp "updated_at", default: -> { "CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP" }, null: false
    t.index ["part_number"], name: "unique_data", unique: true
  end

  create_table "transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "amount"
    t.string "bank_name"
    t.boolean "archived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
  end

  add_foreign_key "colorado_arrests", "colorado_inmates", column: "immate_id", name: "fk_il_tazewell__arrests_il_tazewell__arrestees2"
  add_foreign_key "colorado_charges", "colorado_arrests", column: "arrest_id", name: "fk_il_tazewell__charges_il_tazewell__arrests12"
  add_foreign_key "colorado_court_hearings", "colorado_charges", column: "charge_id", name: "fk_il_tazewell__court_hearings_il_tazewell__charges12"
  add_foreign_key "colorado_holding_facilities", "colorado_arrests", column: "arrest_id", name: "fk_il_tazewell__holding_facilities_il_tazewell__arrests12"
  add_foreign_key "colorado_inmate_additional", "colorado_inmates", column: "immate_id", name: "fk_immate_additional_info_immates10"
  add_foreign_key "colorado_inmate_ids", "colorado_inmates", column: "immate_id", name: "fk_il_tazewell__arrestee_ids_il_tazewell__arrestees13"
  add_foreign_key "transactions", "categories"
end
