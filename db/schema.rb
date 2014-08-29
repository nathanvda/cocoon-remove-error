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

ActiveRecord::Schema.define(version: 20140731143434) do

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "uf"
    t.string   "name"
    t.integer  "capital_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["capital_id"], name: "index_states_on_capital_id"

  create_table "stores", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "name2"
    t.string   "district"
    t.string   "address"
    t.integer  "number"
    t.string   "complement"
    t.string   "cnpj"
    t.integer  "city_id"
    t.string   "mail"
    t.text     "obs"
    t.integer  "status"
    t.string   "phone"
    t.string   "phone2"
    t.string   "phone3"
    t.string   "sversion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["city_id"], name: "index_stores_on_city_id"
  add_index "stores", ["client_id"], name: "index_stores_on_client_id"

  create_table "tickets", force: true do |t|
    t.string   "description"
    t.integer  "customer_id"
    t.integer  "status"
    t.datetime "started_on"
    t.datetime "completed_on"
    t.integer  "priority"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "obs"
  end

  add_index "tickets", ["customer_id"], name: "index_tickets_on_customer_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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
    t.integer  "roles_mask"
    t.string   "name"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
