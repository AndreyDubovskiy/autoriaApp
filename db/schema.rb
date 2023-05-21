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

ActiveRecord::Schema[7.0].define(version: 2023_05_21_090658) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "advertisements", force: :cascade do |t|
    t.string "title"
    t.string "text"
    t.integer "user_id"
    t.integer "auto_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auto_id"], name: "index_advertisements_on_auto_id"
    t.index ["city_id"], name: "index_advertisements_on_city_id"
    t.index ["user_id"], name: "index_advertisements_on_user_id"
  end

  create_table "autos", force: :cascade do |t|
    t.boolean "is_new"
    t.integer "year"
    t.integer "mileage"
    t.integer "type_auto_id"
    t.integer "model_marka_auto_id"
    t.integer "type_kuzov_id"
    t.integer "country_id"
    t.integer "color_id"
    t.integer "type_fuel_id"
    t.integer "type_transmission_id"
    t.integer "type_drive_auto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_autos_on_color_id"
    t.index ["country_id"], name: "index_autos_on_country_id"
    t.index ["model_marka_auto_id"], name: "index_autos_on_model_marka_auto_id"
    t.index ["type_auto_id"], name: "index_autos_on_type_auto_id"
    t.index ["type_drive_auto_id"], name: "index_autos_on_type_drive_auto_id"
    t.index ["type_fuel_id"], name: "index_autos_on_type_fuel_id"
    t.index ["type_kuzov_id"], name: "index_autos_on_type_kuzov_id"
    t.index ["type_transmission_id"], name: "index_autos_on_type_transmission_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marka_autos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_marka_autos", force: :cascade do |t|
    t.string "model"
    t.integer "marka_auto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marka_auto_id"], name: "index_model_marka_autos_on_marka_auto_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "name"
    t.integer "advertisement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_photos_on_advertisement_id"
  end

  create_table "price_data", force: :cascade do |t|
    t.date "date"
    t.integer "advertisement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_id"], name: "index_price_data_on_advertisement_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "count"
    t.integer "valute_id"
    t.integer "price_datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["price_datum_id"], name: "index_prices_on_price_datum_id"
    t.index ["valute_id"], name: "index_prices_on_valute_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auto_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_drive_autos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_fuels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_kuzovs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_transmissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_logins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_user_logins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_user_logins_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "pobatkovi"
    t.string "phone"
    t.integer "user_login_id"
    t.integer "status_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["status_id"], name: "index_users_on_status_id"
    t.index ["user_login_id"], name: "index_users_on_user_login_id"
  end

  create_table "valutes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "advertisements", "autos"
  add_foreign_key "advertisements", "cities"
  add_foreign_key "advertisements", "users"
  add_foreign_key "autos", "colors"
  add_foreign_key "autos", "countries"
  add_foreign_key "autos", "model_marka_autos"
  add_foreign_key "autos", "auto_types"
  add_foreign_key "autos", "type_drive_autos"
  add_foreign_key "autos", "type_fuels"
  add_foreign_key "autos", "type_kuzovs"
  add_foreign_key "autos", "type_transmissions"
  add_foreign_key "model_marka_autos", "marka_autos"
  add_foreign_key "photos", "advertisements"
  add_foreign_key "price_data", "advertisements"
  add_foreign_key "prices", "price_data"
  add_foreign_key "prices", "valutes"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "statuses"
  add_foreign_key "users", "user_logins"
end
