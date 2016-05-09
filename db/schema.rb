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

ActiveRecord::Schema.define(version: 20160506130812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text   "details"
    t.time   "time_allocation"
  end

  create_table "crawls", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "start_postcode"
  end

  create_table "pubs", force: :cascade do |t|
    t.string   "name"
    t.text     "location"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "address",                              default: [],              array: true
    t.decimal  "longitude",  precision: 15, scale: 12
    t.decimal  "latitude",   precision: 15, scale: 12
  end

  create_table "pubs_on_crawls", force: :cascade do |t|
    t.time    "checkin"
    t.boolean "visible"
    t.integer "pub_id"
    t.integer "crawl_id"
  end

  add_index "pubs_on_crawls", ["crawl_id"], name: "index_pubs_on_crawls_on_crawl_id", using: :btree
  add_index "pubs_on_crawls", ["pub_id"], name: "index_pubs_on_crawls_on_pub_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.time    "checkin"
    t.boolean "visible"
    t.integer "pub_id"
    t.integer "crawl_id"
    t.integer "challenge_id"
  end

  add_index "rounds", ["challenge_id"], name: "index_rounds_on_challenge_id", using: :btree
  add_index "rounds", ["crawl_id"], name: "index_rounds_on_crawl_id", using: :btree
  add_index "rounds", ["pub_id"], name: "index_rounds_on_pub_id", using: :btree

  add_foreign_key "rounds", "challenges"
  add_foreign_key "rounds", "crawls"
  add_foreign_key "rounds", "pubs"
end
