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

ActiveRecord::Schema[7.1].define(version: 2023_12_06_223900) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discountedproducts", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "discount_id"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["discount_id"], name: "index_discountedproducts_on_discount_id"
    t.index ["product_id"], name: "index_discountedproducts_on_product_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "code", limit: 20
    t.string "true", limit: 20
    t.string "discount_type", limit: 20
    t.decimal "discount_value", precision: 5, scale: 2
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.boolean "active", default: true
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["code"], name: "index_discounts_on_code", unique: true
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "order_date", precision: nil, default: -> { "CURRENT_TIMESTAMP" }
    t.string "status", limit: 20, default: "Pending"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "email", limit: 100, null: false
    t.string "password_hash", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "full_name", limit: 100
    t.string "address", limit: 255
    t.string "phone_number", limit: 20
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["user_id"], name: "index_users_profiles_on_user_id"
  end

  add_foreign_key "discountedproducts", "discounts"
  add_foreign_key "discountedproducts", "products"
  add_foreign_key "inventories", "products"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
  add_foreign_key "users_profiles", "users"
end
