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

ActiveRecord::Schema.define(:version => 20101203141315) do

  create_table "admins", :force => true do |t|
    t.string   "email",                             :default => "",   :null => false
    t.string   "encrypted_password", :limit => 128, :default => "",   :null => false
    t.string   "password_salt",                     :default => "",   :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                   :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "super",                             :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["unlock_token"], :name => "index_admins_on_unlock_token", :unique => true

  create_table "coupons", :force => true do |t|
    t.string   "coupon_code"
    t.integer  "user_id"
    t.integer  "deal_id"
    t.integer  "status"
    t.datetime "purchased_date"
    t.datetime "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "title"
    t.decimal  "price"
    t.decimal  "value"
    t.string   "description"
    t.string   "fine_print"
    t.datetime "expiration_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_website"
    t.string   "company_phone"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "summary"
    t.boolean  "showoff",            :default => false
  end

  create_table "emails", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deal_id"
    t.integer  "coupon_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.datetime "DOB"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end