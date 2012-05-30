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

ActiveRecord::Schema.define(:version => 20120530004209) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.text     "description", :limit => 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.string   "number"
  end

  add_index "courses", ["number"], :name => "index_courses_on_number"
  add_index "courses", ["subject", "number"], :name => "index_courses_on_subject_and_number", :unique => true
  add_index "courses", ["subject"], :name => "index_courses_on_subject"

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "prerequisites", :force => true do |t|
    t.integer  "prereq_for_id"
    t.integer  "prereq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prerequisites", ["prereq_for_id", "prereq_id"], :name => "index_prerequisites_on_prereq_for_id_and_prereq_id", :unique => true
  add_index "prerequisites", ["prereq_for_id"], :name => "index_prerequisites_on_prereq_for_id"
  add_index "prerequisites", ["prereq_id"], :name => "index_prerequisites_on_prereq_id"

end
