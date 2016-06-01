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

ActiveRecord::Schema.define(version: 20160531055627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiments", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.integer  "budget"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "scientist_id"
  end

  add_index "experiments", ["scientist_id"], name: "index_experiments_on_scientist_id", using: :btree

  create_table "logs", force: :cascade do |t|
    t.string   "subject_name"
    t.boolean  "deceased"
    t.integer  "weight"
    t.integer  "treatments"
    t.string   "comment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "experiment_id"
  end

  add_index "logs", ["experiment_id"], name: "index_logs_on_experiment_id", using: :btree

  create_table "scientists", force: :cascade do |t|
    t.string   "name"
    t.string   "discipline"
    t.boolean  "spooky",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "experiments", "scientists"
  add_foreign_key "logs", "experiments"
end
