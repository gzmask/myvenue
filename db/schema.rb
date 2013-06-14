# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130614173258) do

  create_table "advertisements", :force => true do |t|
    t.string   "name"
    t.string   "flash_file"
    t.integer  "top"
    t.integer  "left"
    t.integer  "width"
    t.integer  "height"
    t.integer  "time_interval"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "playlist_begin"
    t.string   "playlist_finish"
    t.string   "youtube_url"
    t.boolean  "is_youtube"
  end

  create_table "displays", :force => true do |t|
    t.string   "name"
    t.boolean  "is_customize"
    t.text     "html"
    t.text     "css"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_show"
    t.integer  "top"
    t.integer  "left"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.boolean  "is_confirmed"
    t.boolean  "entry_time"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "effective_date"
    t.date     "defective_date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "recurrence"
    t.string   "weekly"
    t.string   "monthly"
    t.boolean  "entry_end_time"
    t.boolean  "entry_bullets"
  end

  create_table "schedules", :force => true do |t|
    t.string   "name"
    t.integer  "venue_id"
    t.integer  "top"
    t.integer  "left"
    t.integer  "width"
    t.integer  "height"
    t.string   "title_color"
    t.string   "title_back_color"
    t.string   "content_color"
    t.string   "content_back_color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_limit"
    t.boolean  "is_title"
    t.integer  "title_font_size"
    t.integer  "content_font_size"
    t.boolean  "is_border"
  end

  create_table "splash_ads", :force => true do |t|
    t.string   "name"
    t.string   "image_file"
    t.integer  "time_interval"
    t.integer  "width"
    t.integer  "height"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "playlist_start"
    t.string   "playlist_end"
  end

  create_table "time_boxes", :force => true do |t|
    t.string   "name"
    t.integer  "time_zone"
    t.integer  "top"
    t.integer  "left"
    t.integer  "font_size"
    t.integer  "venue_id"
    t.boolean  "is_show"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "font_color"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password"
    t.boolean  "is_client"
    t.boolean  "is_admin"
    t.boolean  "is_developer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "weather_code"
    t.integer  "time_zone"
    t.string   "background_image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "time_interval"
    t.string   "twitter"
  end

  create_table "weather_boxes", :force => true do |t|
    t.string   "name"
    t.string   "city_code"
    t.integer  "top"
    t.integer  "left"
    t.integer  "width"
    t.boolean  "is_show"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
