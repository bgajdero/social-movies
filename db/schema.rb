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

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "synopsis"
    t.integer  "critics_rating"
    t.string   "poster"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
