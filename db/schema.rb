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

ActiveRecord::Schema.define(:version => 20110711114854) do

  create_table "loads", :force => true do |t|
    t.integer  "work_id"
    t.string   "P1"
    t.string   "P2"
    t.string   "P3"
    t.string   "P4"
    t.string   "P5"
    t.string   "P6"
    t.string   "P7"
    t.string   "P8"
    t.string   "P9"
    t.string   "P10"
    t.string   "P11"
    t.string   "P12"
    t.string   "P13"
    t.string   "P14"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.string   "plane"
    t.string   "T1P1"
    t.string   "T1P2"
    t.string   "T1P3"
    t.string   "T1P4"
    t.string   "T1P5"
    t.string   "T2P1"
    t.string   "T2P2"
    t.string   "T2P3"
    t.string   "T2P4"
    t.string   "T2P5"
    t.string   "T3P1"
    t.string   "T3P2"
    t.string   "T3P3"
    t.string   "T3P4"
    t.string   "T3P5"
    t.string   "T4P1"
    t.string   "T4P2"
    t.string   "T4P3"
    t.string   "T4P4"
    t.string   "T4P5"
    t.string   "T5P1"
    t.string   "T5P2"
    t.string   "T5P3"
    t.string   "T5P4"
    t.string   "T5P5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
