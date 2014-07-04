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

ActiveRecord::Schema.define(version: 20140702025503) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "manager"
    t.string   "tel"
    t.string   "email"
    t.string   "qq"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliveries", force: true do |t|
    t.string   "delivery_number"
    t.integer  "partner_id"
    t.date     "delivery_date"
    t.integer  "total_items"
    t.decimal  "total_amount"
    t.integer  "creator_id"
    t.integer  "delivery_staff_id"
    t.string   "accounting_voucher_number"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delivery_items", force: true do |t|
    t.integer  "delivery_id"
    t.string   "t_code"
    t.string   "item_name"
    t.integer  "items"
    t.decimal  "price"
    t.decimal  "amount"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "godown_entries", force: true do |t|
    t.string   "godown_number"
    t.integer  "total_items"
    t.decimal  "total_amount",  precision: 2, scale: 12
    t.integer  "status",                                 default: 0
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "godown_items", force: true do |t|
    t.integer  "godown_entry_id"
    t.integer  "product_id"
    t.string   "terminal_code"
    t.string   "model"
    t.string   "sn_code"
    t.decimal  "price",           precision: 2, scale: 12
    t.integer  "items",                                    default: 1
    t.decimal  "amount",          precision: 2, scale: 12
    t.integer  "status",                                   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "partners", force: true do |t|
    t.string   "company_name"
    t.string   "contact"
    t.string   "tel"
    t.string   "email"
    t.string   "qq"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "catalog"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", force: true do |t|
    t.string   "name"
    t.string   "tel"
    t.string   "email"
    t.string   "position"
    t.string   "qq"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
