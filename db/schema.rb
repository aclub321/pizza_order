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

ActiveRecord::Schema[7.0].define(version: 2023_01_22_120501) do
  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.integer "state", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "discount_code", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete", default: false, null: false
  end

  create_table "pizzas", force: :cascade do |t|
    t.integer "pizza_type", limit: 1
    t.integer "pizza_size", limit: 1
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_pizzas_on_order_id"
  end

  create_table "promotion_codes", force: :cascade do |t|
    t.integer "code", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_promotion_codes_on_order_id"
  end

  add_foreign_key "pizzas", "orders"
  add_foreign_key "promotion_codes", "orders"
end
