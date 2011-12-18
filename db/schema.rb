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

ActiveRecord::Schema.define(:version => 20111208070645) do

  create_table "pages", :force => true do |t|
    t.integer  "subject_id"
    t.string   "name",       :limit => 50
    t.string   "permalink",  :limit => 50
    t.integer  "position"
    t.boolean  "visible",                  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["id", "subject_id"], :name => "id"
  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "pages_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "page_id"
  end

  add_index "pages_users", ["user_id", "page_id"], :name => "index_pages_users_on_user_id_and_page_id"

  create_table "section_edits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "section_id"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_edits", ["user_id", "section_id"], :name => "index_section_edits_on_user_id_and_section_id"

  create_table "sections", :force => true do |t|
    t.integer  "page_id",                     :default => 0,    :null => false
    t.string   "name",         :limit => 50
    t.integer  "position"
    t.boolean  "visible",                     :default => true
    t.string   "content_type", :limit => 128
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["page_id"], :name => "index_sections_on_pageID"

  create_table "subjects", :force => true do |t|
    t.string   "name",       :limit => 50
    t.integer  "position"
    t.boolean  "visible",                  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",  :limit => 50
    t.string   "last_name",   :limit => 50
    t.string   "email",                     :default => "",    :null => false
    t.string   "password",    :limit => 40
    t.boolean  "is_admin",                  :default => false
    t.integer  "age",                       :default => 4
    t.text     "description"
    t.date     "dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
