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

ActiveRecord::Schema.define(:version => 20130108010341) do

  create_table "comments", :force => true do |t|
    t.string   "forum"
    t.string   "key"
    t.text     "remote_url"
    t.text     "body"
    t.integer  "parent_key"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["key"], :name => "index_comments_on_key"

  create_table "forums", :force => true do |t|
    t.string   "key"
    t.text     "remote_url"
    t.integer  "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forums", ["key"], :name => "index_forums_on_key"

end
