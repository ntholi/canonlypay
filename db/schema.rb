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

ActiveRecord::Schema.define(version: 20170403093717) do

  create_table "advert_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.integer  "advert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advert_id"], name: "index_advert_comments_on_advert_id"
    t.index ["user_id"], name: "index_advert_comments_on_user_id"
  end

  create_table "adverts", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "product_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_adverts_on_company_id"
    t.index ["product_id"], name: "index_adverts_on_product_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.string   "location"
    t.string   "phone_number"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "accesstoken"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "nickname"
    t.string   "image"
    t.string   "phone"
    t.string   "urls"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "secrettoken"
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "image_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_photos_on_product_id"
  end

  create_table "posts", force: :cascade do |t|
    t.float    "min_price"
    t.float    "max_price"
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "body"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "payable",    default: false
    t.index ["product_id"], name: "index_posts_on_product_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "category"
    t.text     "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.float    "price",               default: 0.0
    t.integer  "year_made"
    t.text     "description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "location"
    t.date     "birthday"
    t.string   "phone_number"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
