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

ActiveRecord::Schema.define(:version => 20131222233141) do

  create_table "blogs", :force => true do |t|
    t.string    "title"
    t.text      "contents"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.boolean   "internal"
  end

  create_table "carousels", :force => true do |t|
    t.string    "picture_url"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "clothing_items", :force => true do |t|
    t.string    "name"
    t.string    "picture_url"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "coaches", :force => true do |t|
    t.string    "name"
    t.text      "bio"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.string    "picture_url"
    t.string    "email"
  end

  create_table "documents", :force => true do |t|
    t.string    "name"
    t.string    "url"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string    "name"
    t.integer   "quantity"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "member_id"
  end

  create_table "equipment_members", :id => false, :force => true do |t|
    t.integer "equipment_id"
    t.integer "member_id"
  end

  add_index "equipment_members", ["equipment_id", "member_id"], :name => "index_equipment_members_on_equipment_id_and_member_id"
  add_index "equipment_members", ["member_id"], :name => "index_equipment_members_on_member_id"

  create_table "events", :force => true do |t|
    t.timestamp "date"
    t.string    "name"
    t.string    "location"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "exercises", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "media", :force => true do |t|
    t.string    "title"
    t.string    "url"
    t.boolean   "is_photo"
    t.boolean   "is_video"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string    "name"
    t.string    "standing"
    t.string    "picture_url"
    t.boolean   "is_officer"
    t.boolean   "is_admin"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
    t.string    "email"
    t.string    "password_hash"
    t.string    "password_salt"
    t.boolean   "is_verified"
    t.integer   "equipment_id"
    t.integer   "position_ids"
  end

  create_table "members_positions", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "position_id"
  end

  add_index "members_positions", ["member_id", "position_id"], :name => "index_members_positions_on_member_id_and_position_id"
  add_index "members_positions", ["position_id"], :name => "index_members_positions_on_position_id"

  create_table "messages", :force => true do |t|
    t.string    "subject"
    t.string    "respond_to_email"
    t.text      "contents"
    t.timestamp "created_at",       :null => false
    t.timestamp "updated_at",       :null => false
    t.string    "name"
  end

  create_table "positions", :force => true do |t|
    t.string    "title"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "member_id"
    t.integer   "ranking"
  end

  create_table "rides", :force => true do |t|
    t.string    "name"
    t.time      "time"
    t.string    "location"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "routes", :force => true do |t|
    t.string    "name"
    t.string    "distance"
    t.string    "elevation"
    t.string    "url"
    t.text      "description"
    t.boolean   "verified"
    t.timestamp "created_at",   :null => false
    t.timestamp "updated_at",   :null => false
    t.string    "map_polyline"
  end

  create_table "sponsors", :force => true do |t|
    t.string    "name"
    t.string    "picture_url"
    t.text      "description"
    t.string    "url"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
    t.integer   "tier"
  end

  create_table "sponsorship_offers", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "workouts", :force => true do |t|
    t.timestamp "date"
    t.text      "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

end
