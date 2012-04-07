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

ActiveRecord::Schema.define(:version => 20120407181506) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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
