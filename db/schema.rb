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

ActiveRecord::Schema.define(version: 20160504144150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crawls", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.string   "start_postcode"
  end

  create_table "pubs", force: :cascade do |t|
    t.string   "name"
    t.text     "location"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "crawl_id"
    t.string   "address",    default: [],              array: true
  end

  add_index "pubs", ["crawl_id"], name: "index_pubs_on_crawl_id", using: :btree

  add_foreign_key "pubs", "crawls"
end