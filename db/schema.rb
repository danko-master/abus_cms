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

ActiveRecord::Schema.define(:version => 20120403140108) do

  create_table "domains", :force => true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mains", :force => true do |t|
    t.text     "title"
    t.text     "content"
    t.text     "metadescription"
    t.text     "metakeywords"
    t.text     "head"
    t.text     "contact"
    t.text     "footer"
    t.text     "counter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "domain",          :default => -1
  end

  create_table "pages", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",            :default => "New Page", :null => false
    t.string   "alias",           :default => ""
    t.text     "title",           :default => ""
    t.text     "content",         :default => ""
    t.text     "metadescription", :default => ""
    t.text     "metakeywords",    :default => ""
    t.text     "head",            :default => ""
    t.boolean  "ismenu",          :default => false,      :null => false
    t.integer  "domain",          :default => -1
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
