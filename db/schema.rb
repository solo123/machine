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

ActiveRecord::Schema.define(version: 20140623052808) do

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.string   "t_code"
    t.string   "model"
    t.string   "sn_code"
    t.decimal  "price"
    t.string   "mobile_number"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "order_date"
    t.string   "order_number"
    t.integer  "provider_id"
    t.integer  "total_items",                           default: 0
    t.decimal  "total_amount", precision: 2, scale: 12
    t.integer  "status",                                default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
