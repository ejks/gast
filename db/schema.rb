# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_14_030756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "deals", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "promotion_id", null: false
    t.boolean "cancel", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_deals_on_customer_id"
    t.index ["promotion_id"], name: "index_deals_on_promotion_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "status"
    t.string "photo_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_promotions_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "wechat_login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "contact_number"
    t.integer "vendor_type"
    t.string "address"
    t.string "description"
    t.string "logo_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

  add_foreign_key "customers", "users"
  add_foreign_key "deals", "customers"
  add_foreign_key "deals", "promotions"
  add_foreign_key "promotions", "vendors"
  add_foreign_key "vendors", "users"
end
