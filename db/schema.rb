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

ActiveRecord::Schema[8.0].define(version: 2025_04_18_173058) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.integer "phone_id", null: false
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_id"], name: "index_customers_on_phone_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "phone_id", null: false
    t.string "calculated_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["phone_id"], name: "index_invoices_on_phone_id"
  end

  create_table "phone_features", force: :cascade do |t|
    t.string "brand"
    t.string "main_camera_info"
    t.string "selfie_camera_info"
    t.string "chipset"
    t.string "os"
    t.string "cpu"
    t.string "gpu"
    t.string "battery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer "phone_feature_id", null: false
    t.string "model"
    t.string "color"
    t.string "price"
    t.string "storage_size"
    t.string "imei_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_feature_id"], name: "index_phones_on_phone_feature_id"
  end

  add_foreign_key "customers", "phones"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "phones"
  add_foreign_key "phones", "phone_features"
end
