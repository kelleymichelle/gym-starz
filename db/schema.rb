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

ActiveRecord::Schema.define(version: 20190828021418) do

  create_table "gymnast_skills", force: :cascade do |t|
    t.integer "gymnast_id"
    t.integer "skill_id"
  end

  create_table "gymnasts", force: :cascade do |t|
    t.string  "name"
    t.integer "gym_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "gym_level"
  end

  create_table "skills", force: :cascade do |t|
    t.string  "name"
    t.string  "category"
    t.integer "level_id"
  end

end
