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

ActiveRecord::Schema[7.0].define(version: 2022_12_13_143241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.integer "ordinal_number", limit: 2, default: 1, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_customers_on_confirmation_token", unique: true
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "property_id", null: false
    t.bigint "room_id", null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.integer "adults", limit: 2
    t.integer "kids", limit: 2
    t.boolean "reservation_confirmed", default: false
    t.boolean "payment_successful", default: false
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["property_id"], name: "index_orders_on_property_id"
    t.index ["room_id"], name: "index_orders_on_room_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_partners_on_confirmation_token", unique: true
    t.index ["email"], name: "index_partners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "day_cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_prices_on_room_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title", null: false
    t.string "address"
    t.decimal "longitude", precision: 6, scale: 4
    t.decimal "latitude", precision: 6, scale: 4
    t.bigint "owner_id", null: false
    t.bigint "town_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_properties_on_category_id"
    t.index ["owner_id"], name: "index_properties_on_owner_id"
    t.index ["town_id"], name: "index_properties_on_town_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.string "title", null: false
    t.integer "guest_base_count", limit: 2, default: 2, null: false
    t.integer "guest_max_count", limit: 2, default: 4, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_rooms_on_property_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name", null: false
    t.string "parent_name", null: false
    t.integer "ordinal_number", limit: 2, default: 1, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "properties"
  add_foreign_key "orders", "rooms"
  add_foreign_key "prices", "rooms"
  add_foreign_key "properties", "categories"
  add_foreign_key "properties", "partners", column: "owner_id"
  add_foreign_key "properties", "towns"
  add_foreign_key "rooms", "properties"
end
