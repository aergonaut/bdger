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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130129080134) do

  create_table "achievements", :force => true do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.text     "body"
    t.string   "short_hash"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "achievements", ["short_hash"], :name => "index_achievements_on_short_hash", :unique => true
  add_index "achievements", ["slug"], :name => "index_achievements_on_slug", :unique => true

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "big_cartel_link"
    t.string   "tumblr_link"
    t.string   "image"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "slug"
  end

  add_index "badges", ["slug"], :name => "index_badges_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "slug"
    t.string   "website"
    t.string   "avatar"
    t.string   "email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
