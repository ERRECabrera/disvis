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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151213031829) do

  create_table "cues", force: :cascade do |t|
    t.float    "starttime"
    t.string   "text"
    t.string   "cueid"
    t.string   "cssclass"
    t.string   "position"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "video_id"
    t.float    "endtime"
    t.integer  "starttimeround"
  end

  add_index "cues", ["user_id"], name: "index_cues_on_user_id"
  add_index "cues", ["video_id"], name: "index_cues_on_video_id"

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "gender"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

  create_table "videos", force: :cascade do |t|
    t.string   "md5"
    t.string   "videotype"
    t.text     "videosrc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "duration"
    t.string   "audiosrc"
  end

end
