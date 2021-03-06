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

ActiveRecord::Schema.define(:version => 20120110041035) do

  create_table "cards", :force => true do |t|
    t.integer  "card_number"
    t.string   "card_type"
    t.string   "expdate_month"
    t.string   "expdate_year"
    t.string   "cvv_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "companies", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "company_email"
    t.string   "name"
    t.string   "mobile_no"
    t.string   "email"
    t.string   "password_digest"
    t.string   "level"
    t.string   "mobile_no_confirmation"
  end

  create_table "credit_cards", :force => true do |t|
    t.string   "card_number"
    t.string   "card_type"
    t.string   "expdate_month"
    t.string   "expdate_year"
    t.string   "cvv_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "mobiles", :force => true do |t|
    t.string   "mobile_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mobile_alias"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "mobile_no"
    t.string   "mobile_no_confirmation"
    t.string   "mobile_alias"
    t.string   "mobile_plan"
    t.string   "month"
    t.string   "day"
    t.string   "year"
    t.string   "network"
    t.string   "phone_manufacturer"
    t.string   "first_name"
    t.string   "last_name"
  end

end
