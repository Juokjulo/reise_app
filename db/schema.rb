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

ActiveRecord::Schema.define(version: 20170320172954) do

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.text     "shortDescription"
    t.integer  "picture_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["picture_id"], name: "index_countries_on_picture_id"
  end

  create_table "material_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.string   "sponsor"
    t.integer  "material_category_id"
    t.integer  "picture_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "public",               default: true
    t.string   "sponsor_link"
    t.text     "description"
    t.string   "amazon_link"
    t.index ["material_category_id"], name: "index_materials_on_material_category_id"
    t.index ["picture_id"], name: "index_materials_on_picture_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string   "title"
    t.text     "letter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_pictures_on_country_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.integer  "country_id"
    t.integer  "user_id"
    t.integer  "picture_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "public"
    t.index ["country_id"], name: "index_stories_on_country_id"
    t.index ["picture_id"], name: "index_stories_on_picture_id"
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "storytext_pictures", force: :cascade do |t|
    t.string   "options"
    t.integer  "size"
    t.integer  "storytext_id"
    t.integer  "picture_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["picture_id"], name: "index_storytext_pictures_on_picture_id"
    t.index ["storytext_id"], name: "index_storytext_pictures_on_storytext_id"
  end

  create_table "storytexts", force: :cascade do |t|
    t.string   "title"
    t.text     "storypart"
    t.integer  "story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_storytexts_on_story_id"
  end

  create_table "travel_tipps", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_travel_tipps_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.boolean  "newsletter_abo",         default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
