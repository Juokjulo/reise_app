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

ActiveRecord::Schema.define(version: 20180110201806) do

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "email"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.text     "shortDescription"
    t.integer  "picture_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "public"
    t.index ["picture_id"], name: "index_countries_on_picture_id"
  end

  create_table "material_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gear_type",  default: 0
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

  create_table "news", force: :cascade do |t|
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean  "public"
    t.index ["country_id"], name: "index_pictures_on_country_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "title"
    t.text     "maplink"
    t.text     "description"
    t.string   "garminlink"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "travel_tipps", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "public"
    t.integer  "travel_tipps_category_id"
    t.index ["country_id"], name: "index_travel_tipps_on_country_id"
    t.index ["travel_tipps_category_id"], name: "index_travel_tipps_on_travel_tipps_category_id"
  end

  create_table "travel_tipps_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_tipps_segments", force: :cascade do |t|
    t.string   "titleLeft"
    t.text     "contentLeft"
    t.boolean  "borderLeft",     default: false
    t.string   "colorLeft"
    t.string   "titleRight"
    t.text     "contentRight"
    t.boolean  "borderRight",    default: false
    t.string   "colorRight"
    t.boolean  "fullsize",       default: false
    t.integer  "travel_tipp_id"
    t.integer  "picture_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["picture_id"], name: "index_travel_tipps_segments_on_picture_id"
    t.index ["travel_tipp_id"], name: "index_travel_tipps_segments_on_travel_tipp_id"
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

  create_table "videos", force: :cascade do |t|
    t.boolean  "public"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_videos_on_country_id"
  end

end
