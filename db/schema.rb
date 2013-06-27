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

ActiveRecord::Schema.define(:version => 20130627101941) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

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
    t.string   "image"
  end

  create_table "follows", :force => true do |t|
    t.integer  "followable_id",                      :null => false
    t.string   "followable_type",                    :null => false
    t.integer  "follower_id",                        :null => false
    t.string   "follower_type",                      :null => false
    t.boolean  "blocked",         :default => false, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "follows", ["followable_id", "followable_type"], :name => "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], :name => "fk_follows"

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "farm_id"
    t.decimal  "ammount"
    t.decimal  "price"
    t.string   "category"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.float    "pic_file_size"
    t.datetime "pic_updated_at"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "delta",            :default => true, :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "distance"
    t.string   "image"
    t.date     "avail_from"
    t.date     "avail_until"
  end

  create_table "swaps", :force => true do |t|
    t.string   "name"
    t.string   "plant_type"
    t.string   "description"
    t.integer  "user_id"
    t.string   "swappic_file_name"
    t.string   "swappic_content_type"
    t.float    "swappic_file_size"
    t.datetime "swappic_updated_at"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.string   "name"
    t.string   "description"
    t.boolean  "admin",                  :default => true
    t.string   "avatar"
    t.string   "street_name"
    t.string   "bldg_name"
    t.string   "region"
    t.integer  "post_code"
    t.string   "province"
    t.integer  "contact_number"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "delta",                  :default => true, :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.float    "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
