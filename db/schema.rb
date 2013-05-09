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

ActiveRecord::Schema.define(:version => 20130509165707) do

  create_table "farms", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "description"
    t.string   "street_name"
    t.string   "bldg_name"
    t.string   "region"
    t.integer  "post_code"
    t.string   "province"
    t.integer  "contact_number"
    t.string   "products"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.float    "pic_file_size"
    t.datetime "pic_updated_at"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "organic"
    t.boolean  "deliver"
    t.boolean  "swap"
    t.boolean  "delta",                :default => true, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "farmtype"
    t.string   "farmpic_file_name"
    t.string   "farmpic_content_type"
    t.float    "farmpic_file_size"
    t.datetime "farmpic_updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "farm_id"
    t.decimal  "ammount",          :precision => 10, :scale => 0
    t.decimal  "price",            :precision => 10, :scale => 0
    t.string   "category"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.float    "pic_file_size"
    t.datetime "pic_updated_at"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "delta",                                           :default => true, :null => false
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "description"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               :default => true
    t.string   "avatar"
    t.string   "street_name"
    t.string   "bldg_name"
    t.string   "region"
    t.integer  "post_code"
    t.string   "province"
    t.integer  "contact_number"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "delta",               :default => true, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.float    "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
