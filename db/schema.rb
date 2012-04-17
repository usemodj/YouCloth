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

ActiveRecord::Schema.define(:version => 20120327033915) do

  create_table "cloth_items", :force => true do |t|
    t.integer  "no"
    t.string   "name"
    t.integer  "unit_price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cloth_items", ["name"], :name => "index_cloth_items_on_name", :unique => true

  create_table "cloths", :force => true do |t|
    t.integer  "unit_price"
    t.integer  "count"
    t.string   "repair"
    t.integer  "repair_price"
    t.string   "status"
    t.date     "released_on"
    t.integer  "wash_id"
    t.integer  "cloth_item_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body"
    t.string   "subject",          :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "phone"
    t.string   "address"
    t.string   "address2"
    t.string   "zipcode"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "customers", ["user_id"], :name => "index_customers_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "subject"
    t.text     "body"
    t.integer  "replies"
    t.integer  "views"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "role_roles", :force => true do |t|
    t.integer  "role_id"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "roles_users", :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "washes", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "mobile"
    t.string   "phone"
    t.string   "address"
    t.string   "address2"
    t.date     "stocked_on"
    t.date     "released_on"
    t.string   "status"
    t.text     "memo"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
