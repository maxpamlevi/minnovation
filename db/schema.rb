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

ActiveRecord::Schema.define(version: 2021_09_25_124550) do

  create_table "auctions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "started_at"
    t.integer "status"
    t.bigint "winner_id"
    t.bigint "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_auctions_on_product_id"
    t.index ["winner_id"], name: "index_auctions_on_winner_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "vehicle_make"
    t.string "model"
    t.string "name"
    t.string "vehicle_code"
    t.string "color"
    t.string "transmission"
    t.string "fuel_type"
    t.string "engine_type"
    t.string "engine_capacity"
    t.string "power"
    t.string "fuel_consumption"
    t.integer "manufacturing_year"
    t.decimal "price", precision: 19, scale: 2
    t.integer "discount"
    t.text "features"
    t.text "description"
    t.text "accessories"
    t.string "thumbnail"
    t.string "logo"
    t.integer "state"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_products_on_owner_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "auctions", "users", column: "winner_id"
  add_foreign_key "products", "users", column: "owner_id"
end
