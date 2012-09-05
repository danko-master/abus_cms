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

ActiveRecord::Schema.define(:version => 20120829120808) do

  create_table "cars", :force => true do |t|
    t.string   "name"
    t.integer  "seats"
    t.text     "short"
    t.text     "long"
    t.boolean  "is_show"
    t.boolean  "is_special"
    t.text     "title"
    t.text     "metadescription"
    t.text     "metakeywords"
    t.text     "alias"
    t.integer  "price_hour"
    t.integer  "price_MKAD"
    t.string   "min_zakaz"
    t.integer  "transfer_sheremetevo"
    t.integer  "transfer_vnukovo"
    t.integer  "transfer_domodedovo"
    t.integer  "transfer_ostafevo"
    t.integer  "transfer_bikovo"
    t.integer  "transfer_airport_airport"
    t.integer  "transfer_airport_station"
    t.integer  "transfer_station_airport"
    t.integer  "weeding_price_hour"
    t.integer  "weeding_price_MKAD"
    t.string   "weeding_min_zakaz"
    t.string   "weeding_friday"
    t.string   "weeding_saturday"
    t.string   "weeding_decor"
    t.string   "holiday"
    t.string   "holiday_min_zakaz"
    t.string   "holiday_weeding_min_zakaz"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars_domains", :force => true do |t|
    t.integer  "car_id"
    t.integer  "domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cars_domains", ["car_id", "domain_id"], :name => "index_cars_domains_on_car_id_and_domain_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "domains", :force => true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "name"
    t.string   "image_file"
    t.string   "image_thumb_file"
    t.integer  "car_id"
    t.integer  "order_id"
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
