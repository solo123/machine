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

ActiveRecord::Schema.define(version: 20140731025035) do

  create_table "account_histories", force: true do |t|
    t.integer  "account_id"
    t.decimal  "balance_before",   precision: 2, scale: 12
    t.decimal  "amount",           precision: 2, scale: 12
    t.decimal  "balance",          precision: 2, scale: 12
    t.integer  "order_payment_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.integer  "partner_id"
    t.decimal  "balance",    precision: 2, scale: 12, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "employees", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "display_name",           default: ""
    t.string   "roles",                  default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true

  create_table "godown_entries", force: true do |t|
    t.string   "godown_number"
    t.integer  "product_id"
    t.integer  "warehouse_id"
    t.integer  "total_items"
    t.decimal  "total_amount",  precision: 2, scale: 12
    t.integer  "status",                                 default: 0
    t.integer  "creator_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "godown_items", force: true do |t|
    t.integer  "godown_entry_id"
    t.integer  "product_id"
    t.integer  "warehouse_id"
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

  create_table "order_imports", force: true do |t|
    t.string   "product_name"
    t.integer  "product_id"
    t.string   "terminal_code"
    t.string   "sn_code"
    t.decimal  "price",         precision: 2, scale: 12
    t.integer  "status",                                 default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "godown_item_id"
    t.string   "t_code"
    t.decimal  "price",          precision: 2, scale: 12
    t.integer  "items"
    t.decimal  "amount",         precision: 2, scale: 12
    t.string   "notes"
    t.integer  "status",                                  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_payments", force: true do |t|
    t.integer  "order_id"
    t.decimal  "balance_before", precision: 2, scale: 12
    t.decimal  "pay_amount",     precision: 2, scale: 12
    t.decimal  "balance",        precision: 2, scale: 12, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "order_date"
    t.string   "order_number"
    t.integer  "partner_id"
    t.string   "contact_name"
    t.string   "contact_tel"
    t.string   "contact_email"
    t.integer  "total_items",                            default: 0
    t.decimal  "total_amount",  precision: 2, scale: 12, default: 0.0
    t.decimal  "balance",       precision: 2, scale: 12, default: 0.0
    t.string   "notes"
    t.integer  "order_type",                             default: 0
    t.integer  "status",                                 default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", force: true do |t|
    t.string   "partner_name"
    t.string   "contact"
    t.string   "tel"
    t.string   "email"
    t.string   "qq"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prepare_data", force: true do |t|
    t.string   "c0"
    t.string   "c1"
    t.string   "c2"
    t.string   "c3"
    t.string   "c4"
    t.string   "c5"
    t.string   "c6"
    t.string   "c7"
    t.string   "c8"
    t.string   "c9"
    t.integer  "usage"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_histories", force: true do |t|
    t.integer  "warehouse_id"
    t.integer  "product_id"
    t.integer  "operate_sheet_id"
    t.string   "operate_sheet_type"
    t.integer  "before_items"
    t.integer  "change_items"
    t.integer  "now_items"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "catalog"
    t.decimal  "godown_price", precision: 2, scale: 12
    t.decimal  "sale_price",   precision: 2, scale: 12
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_warehouses", force: true do |t|
    t.integer  "warehouse_id"
    t.integer  "product_id"
    t.integer  "store_item",   default: 0
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

  create_table "warehouses", force: true do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
