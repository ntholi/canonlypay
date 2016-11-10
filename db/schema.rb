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

ActiveRecord::Schema.define(version: 20161110103707) do

  create_table "advertisers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "email"
    t.string   "company_name"
    t.string   "location"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "adverts", force: :cascade do |t|
    t.integer  "advertiser_id"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["advertiser_id"], name: "index_adverts_on_advertiser_id"
    t.index ["product_id"], name: "index_adverts_on_product_id"
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
    t.text     "content"
    t.float    "min_price"
    t.float    "max_price"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_posts_on_product_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "category"
    t.string   "keywords"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "product_category_id"
    t.float    "price"
    t.integer  "year_made"
    t.text     "description"
    t.integer  "advertiser_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["advertiser_id"], name: "index_products_on_advertiser_id"
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "display_name"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "email"
    t.string   "gender"
    t.string   "location"
    t.date     "birthday"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
