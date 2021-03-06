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

ActiveRecord::Schema.define(:version => 20180630080414) do

  create_table "bills", :force => true do |t|
    t.string   "bill_type"
    t.integer  "bill_no"
    t.date     "issue_date"
    t.integer  "amount"
    t.string   "status"
    t.integer  "cheque_no"
    t.string   "bank_name"
    t.date     "credited_on"
    t.integer  "remaining_amount"
    t.string   "collected_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.text     "address"
    t.string   "area"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "consumer_no"
    t.string   "flavors"
    t.integer  "machine_count"
    t.integer  "plan"
    t.date     "installation_date"
    t.integer  "quote"
    t.integer  "period"
    t.string   "gstid"
    t.text     "how_to_reach"
    t.boolean  "hidden",            :default => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "bill_id"
    t.integer  "customer_id"
    t.date     "reminder"
    t.string   "remark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.date     "published_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "title"
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
    t.string   "api_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
