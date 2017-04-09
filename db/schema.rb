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

ActiveRecord::Schema.define(version: 20170406015237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name_category"
    t.string   "color"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "has_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_has_categories_on_category_id", using: :btree
    t.index ["product_id"], name: "index_has_categories_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "titulo",               default: "",  null: false
    t.string   "desc_corta",           default: ""
    t.text     "desc",                 default: ""
    t.float    "precio"
    t.float    "rating",               default: 2.5
    t.string   "tipo",                 default: ""
    t.string   "marca",                default: ""
    t.string   "modelo",               default: ""
    t.integer  "stock",                default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "LastName"
    t.string   "NickName"
    t.integer  "ZipCode"
    t.string   "address"
    t.integer  "PhoneNumber"
    t.datetime "Birthday"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "has_categories", "categories"
  add_foreign_key "has_categories", "products"
end
