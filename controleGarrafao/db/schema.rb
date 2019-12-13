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

ActiveRecord::Schema.define(version: 2019_12_13_143228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bottles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_bottles", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "client_id"
    t.bigint "bottle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_client_bottles_on_bottle_id"
    t.index ["client_id"], name: "index_client_bottles_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.integer "number"
    t.string "rmk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_bottles", "bottles"
  add_foreign_key "client_bottles", "clients"
end
