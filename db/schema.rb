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

ActiveRecord::Schema.define(version: 20150915175107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.float    "cash_balance"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "portfolio_compositions", force: :cascade do |t|
    t.integer  "portfolio_id"
    t.integer  "stock_id"
    t.float    "weight"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "portfolio_compositions", ["portfolio_id"], name: "index_portfolio_compositions_on_portfolio_id", using: :btree
  add_index "portfolio_compositions", ["stock_id"], name: "index_portfolio_compositions_on_stock_id", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.string   "name"
    t.float    "divisor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "name"
    t.string   "sector"
    t.string   "exchange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "close"
  end

  create_table "trades", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "portfolio_id"
    t.integer  "quantity"
    t.float    "traded_price"
    t.integer  "deal_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "trades", ["client_id"], name: "index_trades_on_client_id", using: :btree
  add_index "trades", ["portfolio_id"], name: "index_trades_on_portfolio_id", using: :btree

  add_foreign_key "portfolio_compositions", "portfolios"
  add_foreign_key "portfolio_compositions", "stocks"
  add_foreign_key "trades", "clients"
  add_foreign_key "trades", "portfolios"
end
