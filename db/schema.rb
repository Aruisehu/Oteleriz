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

ActiveRecord::Schema.define(version: 20180129000756) do

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
  end

  create_table "dishes", force: :cascade do |t|
    t.jsonb "name_translations"
    t.jsonb "description_translations"
    t.boolean "ask_roasting"
  end

  create_table "formula_templates", force: :cascade do |t|
    t.boolean "has_starter"
    t.boolean "has_dish"
    t.boolean "has_dessert"
    t.decimal "price", precision: 9, scale: 2
  end

  create_table "formulas", force: :cascade do |t|
    t.string "roasting"
    t.bigint "starter_id"
    t.bigint "dish_id"
    t.bigint "dessert_id"
    t.bigint "formula_template_id"
    t.bigint "baking_id"
    t.index ["baking_id"], name: "index_formulas_on_baking_id"
    t.index ["dessert_id"], name: "index_formulas_on_dessert_id"
    t.index ["dish_id"], name: "index_formulas_on_dish_id"
    t.index ["formula_template_id"], name: "index_formulas_on_formula_template_id"
    t.index ["starter_id"], name: "index_formulas_on_starter_id"
  end

  create_table "formulas_orders", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "formula_id", null: false
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
    t.float "services"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.boolean "confirmed"
    t.boolean "newsletter"
    t.integer "number_persons"
    t.bigint "meal_id"
    t.index ["meal_id"], name: "index_orders_on_meal_id"
  end

  create_table "starters", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  add_foreign_key "orders", "meals"
end
