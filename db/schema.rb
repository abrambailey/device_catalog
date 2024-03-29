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

ActiveRecord::Schema.define(:version => 20120421063904) do

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.integer  "submodel_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "model_id"
    t.integer  "brand_id"
    t.integer  "channels"
    t.string   "battery"
    t.integer  "programs"
    t.string   "generic"
    t.string   "options"
    t.string   "dimage_file_name"
    t.string   "dimage_content_type"
    t.integer  "dimage_file_size"
    t.datetime "dimage_updated_at"
  end

  create_table "submodels", :force => true do |t|
    t.string   "name"
    t.integer  "model_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "brand_id"
  end

end
