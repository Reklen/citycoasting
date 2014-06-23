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

ActiveRecord::Schema.define(version: 20140623044542) do

  create_table "stamps", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "category"
    t.integer  "price_range"
    t.integer  "neighborhood"
    t.string   "name"
    t.string   "adr_street_number"
    t.string   "adr_route"
    t.string   "adr_city"
    t.string   "adr_postal_code"
    t.string   "adr_state"
    t.string   "adr_country"
    t.string   "phone_number"
    t.string   "bus_id"
    t.string   "adr_lat"
    t.string   "adr_lng"
    t.string   "website"
    t.float    "adr_coord_lat"
    t.float    "adr_coord_lng"
    t.text     "google_place_id"
    t.string   "formatted_address"
  end

  add_index "stamps", ["category"], name: "index_stamps_on_category"
  add_index "stamps", ["user_id"], name: "index_stamps_on_user_id"

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
    t.string   "name"
    t.string   "username"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
