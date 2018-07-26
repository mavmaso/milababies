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

ActiveRecord::Schema.define(version: 2018_07_26_005156) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

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
    t.decimal "wage"
    t.integer "status"
  end

  create_table "proposals", force: :cascade do |t|
    t.date "booked_date"
    t.time "start_hour"
    t.time "end_hour"
    t.text "message"
    t.integer "au_pair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "final_price"
    t.index ["au_pair_id"], name: "index_proposals_on_au_pair_id"
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
