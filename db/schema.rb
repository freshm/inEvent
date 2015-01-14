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

ActiveRecord::Schema.define(version: 20150113125830) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.datetime "appointment"
    t.string   "location"
    t.boolean  "private"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.integer  "max_participants"
    t.string   "picture"
  end

  create_table "identities", force: true do |t|
    t.integer  "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribed_events", force: true do |t|
    t.boolean  "participate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "events_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "gender"
    t.string   "image_url"
    t.integer  "event_id"
    t.boolean  "firstname_private",      default: false
    t.boolean  "lastname_private",       default: false
    t.boolean  "gender_private",         default: false
    t.boolean  "birthday_private",       default: false
    t.boolean  "city_private",           default: false
    t.boolean  "zipcode_private",        default: false
    t.boolean  "interests_private",      default: false
    t.string   "avatar"
    t.date     "birthday"
    t.string   "city"
    t.string   "zipcode"
    t.text     "interests"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
