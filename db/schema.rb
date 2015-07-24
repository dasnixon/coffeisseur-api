# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150724042759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_shop_locations", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "phone_country_code"
    t.string   "unit"
    t.string   "building"
    t.string   "street"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.string   "address_code"
    t.integer  "coffee_shop_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "coffee_shop_locations", ["coffee_shop_id"], name: "index_coffee_shop_locations_on_coffee_shop_id", using: :btree

  create_table "coffee_shops", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.string   "site"
    t.string   "email"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "coffee_shops", ["name"], name: "index_coffee_shops_on_name", unique: true, using: :btree

  create_table "coffee_shops_roasts", id: false, force: :cascade do |t|
    t.integer "coffee_shop_id", null: false
    t.integer "roast_id",       null: false
  end

  add_index "coffee_shops_roasts", ["coffee_shop_id", "roast_id"], name: "index_coffee_shops_roasts_on_coffee_shop_id_and_roast_id", unique: true, using: :btree

  create_table "cups", force: :cascade do |t|
    t.string   "name",           null: false
    t.text     "description"
    t.string   "brew_process"
    t.integer  "rating"
    t.integer  "coffee_shop_id"
    t.integer  "roast_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "cups", ["coffee_shop_id"], name: "index_cups_on_coffee_shop_id", using: :btree
  add_index "cups", ["roast_id"], name: "index_cups_on_roast_id", using: :btree
  add_index "cups", ["user_id"], name: "index_cups_on_user_id", using: :btree

  create_table "roasters", force: :cascade do |t|
    t.string   "name",               null: false
    t.datetime "founded"
    t.text     "description"
    t.string   "site"
    t.string   "email"
    t.string   "phone"
    t.string   "phone_country_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "roasters", ["name"], name: "index_roasters_on_name", unique: true, using: :btree

  create_table "roasts", force: :cascade do |t|
    t.string   "name",         null: false
    t.text     "description",  null: false
    t.integer  "price_per_lb"
    t.string   "origin"
    t.string   "process"
    t.integer  "roaster_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "roasts", ["roaster_id"], name: "index_roasts_on_roaster_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.text     "about"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
