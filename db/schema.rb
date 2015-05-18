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

ActiveRecord::Schema.define(version: 20150518172605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token"
    t.string   "scope"
    t.datetime "expired_at"
    t.datetime "created_at"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "beans", force: :cascade do |t|
    t.string   "name",                            null: false
    t.text     "description",                     null: false
    t.string   "degree_of_roast",                 null: false
    t.string   "farm"
    t.string   "varietal"
    t.string   "processing"
    t.string   "grade"
    t.string   "appearance"
    t.string   "country",                         null: false
    t.string   "region",                          null: false
    t.boolean  "organic",         default: false
    t.boolean  "espresso",        default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "characteristics"
  end

  create_table "roasts", force: :cascade do |t|
    t.string   "degree_of_roast", null: false
    t.text     "description"
    t.string   "roasted_with"
    t.integer  "time",            null: false
    t.integer  "first_crack_at"
    t.integer  "second_crack_at"
    t.integer  "bean_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "roasts", ["bean_id"], name: "index_roasts_on_bean_id", using: :btree
  add_index "roasts", ["user_id"], name: "index_roasts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "email",                                  null: false
    t.boolean  "roaster",          default: false
    t.text     "about"
    t.string   "username"
    t.string   "favorite_roaster"
    t.string   "password_digest"
    t.string   "role",             default: "non-admin"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

  add_foreign_key "api_keys", "users"
end
