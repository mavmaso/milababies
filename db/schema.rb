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

ActiveRecord::Schema.define(version: 2018_07_24_010254) do

  create_table "au_pairs", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "social_media"
    t.string "cpf"
    t.text "skills"
    t.string "degree"
    t.string "languages"
    t.date "birth_date"
    t.string "city"
    t.integer "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "au_pair_id"
    t.index ["au_pair_id"], name: "index_testimonials_on_au_pair_id"
  end

end
