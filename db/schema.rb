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

ActiveRecord::Schema.define(:version => 20111106000154) do

  create_table "artist_events", :force => true do |t|
    t.integer  "event_id"
    t.integer  "artist_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artist_tracks", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "track_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artist_users", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "user_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", :force => true do |t|
    t.string   "mbid"
    t.string   "name"
    t.string   "url"
    t.string   "image"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_users", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "uid"
    t.string   "title"
    t.string   "country"
    t.string   "city"
    t.datetime "start_at"
    t.string   "image"
    t.integer  "attendance"
    t.string   "url"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "similar_tracks", :force => true do |t|
    t.integer  "track_id"
    t.integer  "similar_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "similars", :id => false, :force => true do |t|
    t.integer  "artist_id"
    t.integer  "similar_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "track_users", :force => true do |t|
    t.integer  "track_id"
    t.integer  "user_id"
    t.integer  "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", :force => true do |t|
    t.integer  "uid"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "uid"
    t.string   "image"
    t.string   "country"
    t.integer  "age"
    t.string   "gender"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
