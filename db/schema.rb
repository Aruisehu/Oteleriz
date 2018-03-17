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

ActiveRecord::Schema.define(version: 20180314094724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bakings", force: :cascade do |t|
    t.jsonb "name_translations"
    t.jsonb "description_translations"
    t.jsonb "ingredient_translations"
  end

  create_table "desserts", force: :cascade do |t|
    t.jsonb "name_translations"
    t.jsonb "description_translations"
    t.decimal "price"
    t.string "img_url"
  end

  create_table "dishes", force: :cascade do |t|
    t.jsonb "name_translations"
    t.jsonb "description_translations"
    t.boolean "ask_roasting"
    t.decimal "price"
    t.string "img_url"
  end

  create_table "formula_templates", force: :cascade do |t|
    t.boolean "has_starter"
    t.boolean "has_dish"
    t.boolean "has_dessert"
    t.decimal "price", precision: 9, scale: 2
    t.jsonb "name_translations"
    t.boolean "has_wine"
    t.jsonb "wine_translations"
  end

  create_table "formulas", force: :cascade do |t|
    t.string "roasting"
    t.bigint "starter_id"
    t.bigint "dish_id"
    t.bigint "dessert_id"
    t.bigint "order_id"
    t.bigint "formula_template_id"
    t.bigint "baking_id"
    t.index ["baking_id"], name: "index_formulas_on_baking_id"
    t.index ["dessert_id"], name: "index_formulas_on_dessert_id"
    t.index ["dish_id"], name: "index_formulas_on_dish_id"
    t.index ["formula_template_id"], name: "index_formulas_on_formula_template_id"
    t.index ["order_id"], name: "index_formulas_on_order_id"
    t.index ["starter_id"], name: "index_formulas_on_starter_id"
  end

  create_table "groups", force: :cascade do |t|
  end

  create_table "marinades", force: :cascade do |t|
    t.jsonb "name_translations"
    t.jsonb "description_translations"
    t.bigint "baking_id"
    t.bigint "dish_id"
    t.index ["baking_id"], name: "index_marinades_on_baking_id"
    t.index ["dish_id"], name: "index_marinades_on_dish_id"
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.boolean "confirmed"
    t.boolean "newsletter"
    t.integer "number_persons"
    t.bigint "service_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_orders_on_group_id"
    t.index ["service_id"], name: "index_orders_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "meal_id"
    t.boolean "ended", default: false
    t.integer "seats", default: 0
    t.index ["meal_id"], name: "index_services_on_meal_id"
  end

  create_table "starters", force: :cascade do |t|
    t.jsonb "name_translations"
    t.jsonb "description_translations"
    t.decimal "price"
    t.string "img_url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
