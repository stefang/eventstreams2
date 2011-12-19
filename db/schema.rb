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

ActiveRecord::Schema.define(:version => 20111219165638) do

  create_table "event_assets", :force => true do |t|
    t.string   "title"
    t.integer  "event_id"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "event_menus", :force => true do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.integer  "event_id"
    t.integer  "item_order"
    t.string   "title"
    t.string   "url"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_news_items", :force => true do |t|
    t.string   "headline"
    t.text     "content"
    t.date     "item_date"
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "event_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "event_id"
    t.boolean  "published"
    t.string   "slug"
    t.integer  "item_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "published"
    t.string   "tagline"
    t.text     "description"
    t.string   "twitter_account"
    t.string   "twitter_hashtag"
    t.string   "google_analytics"
    t.string   "booking_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
    t.string   "event_logo_file_name"
    t.string   "event_logo_content_type"
    t.integer  "event_logo_file_size"
    t.datetime "event_logo_updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "event_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.text     "biog"
    t.integer  "event_id"
    t.boolean  "published"
    t.string   "slug"
    t.string   "portrait_file_name"
    t.string   "portrait_content_type"
    t.integer  "portrait_file_size"
    t.datetime "portrait_updated_at"
    t.integer  "item_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speakers_talks", :id => false, :force => true do |t|
    t.integer "speaker_id"
    t.integer "talk_id"
  end

  create_table "sponsors", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "event_id"
    t.string   "url"
    t.integer  "item_order"
    t.boolean  "published"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "sponsor_type",      :default => "Sponsor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "event_id"
    t.string   "slug"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start"
    t.integer  "duration"
    t.integer  "track_id"
    t.integer  "venue_id"
  end

  create_table "tracks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "event_id"
    t.string   "slug"
    t.boolean  "published"
    t.integer  "item_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "superadmin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "address"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "website"
    t.string   "phone_number"
    t.boolean  "published"
    t.integer  "event_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_order"
  end

end
