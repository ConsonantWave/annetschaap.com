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

ActiveRecord::Schema.define(:version => 20100708032632) do

  create_table "admins", :force => true do |t|
    t.string   "login",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name_en"
    t.string   "name_nl"
    t.text     "content_en"
    t.text     "content_nl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_en_file_name"
    t.string   "image_en_content_type"
    t.integer  "image_en_file_size"
    t.datetime "image_en_updated_at"
    t.string   "image_nl_file_name"
    t.string   "image_nl_content_type"
    t.integer  "image_nl_file_size"
    t.datetime "image_nl_updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "category_id"
    t.string   "name_en"
    t.string   "name_nl"
    t.text     "description_en"
    t.text     "description_nl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_en_file_name"
    t.string   "icon_en_content_type"
    t.integer  "icon_en_file_size"
    t.datetime "icon_en_updated_at"
    t.string   "icon_nl_file_name"
    t.string   "icon_nl_content_type"
    t.integer  "icon_nl_file_size"
    t.datetime "icon_nl_updated_at"
    t.integer  "year"
    t.integer  "license_id"
  end

  create_table "illustrations", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "name_en"
    t.string   "name_nl"
    t.text     "comment_en"
    t.text     "comment_nl"
    t.integer  "year"
    t.integer  "license_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "sorted_order",       :default => 0, :null => false
  end

  add_index "illustrations", ["sorted_order"], :name => "index_illustrations_on_sorted_order"

  create_table "licenses", :force => true do |t|
    t.string   "name_en"
    t.string   "name_nl"
    t.text     "description_en"
    t.text     "description_nl"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "downloadable"
  end

end
