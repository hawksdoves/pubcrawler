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

ActiveRecord::Schema.define(version: 20160506102106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.text   "details"
    t.time   "time_allocation"
  end

  create_table "crawl_challenges", force: :cascade do |t|
    t.integer "challenge_id"
    t.integer "crawl_id"
  end

  add_index "crawl_challenges", ["challenge_id"], name: "index_crawl_challenges_on_challenge_id", using: :btree
  add_index "crawl_challenges", ["crawl_id"], name: "index_crawl_challenges_on_crawl_id", using: :btree

  create_table "crawl_pubs", force: :cascade do |t|
    t.time    "checkin"
    t.boolean "visible"
    t.integer "pub_id"
    t.integer "crawl_id"
  end

  add_index "crawl_pubs", ["crawl_id"], name: "index_crawl_pubs_on_crawl_id", using: :btree
  add_index "crawl_pubs", ["pub_id"], name: "index_crawl_pubs_on_pub_id", using: :btree

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

  add_foreign_key "crawl_challenges", "challenges"
  add_foreign_key "crawl_challenges", "crawls"
  add_foreign_key "crawl_pubs", "crawls"
  add_foreign_key "crawl_pubs", "pubs"
end
