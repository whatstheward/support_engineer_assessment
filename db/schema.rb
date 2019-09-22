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

ActiveRecord::Schema.define(version: 2018_11_03_012847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "publisher"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookshelves", force: :cascade do |t|
    t.integer "rating"
    t.integer "times_read"
    t.bigint "engineer_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_bookshelves_on_book_id"
    t.index ["engineer_id"], name: "index_bookshelves_on_engineer_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "capital"
    t.string "region"
    t.integer "population"
    t.integer "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "engineer_programming_languages", force: :cascade do |t|
    t.string "proficency"
    t.integer "repositories"
    t.bigint "engineer_id"
    t.bigint "programming_language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["engineer_id"], name: "index_engineer_programming_languages_on_engineer_id"
    t.index ["programming_language_id"], name: "index_engineer_programming_languages_on_programming_language_id"
  end

  create_table "engineers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "email"
    t.bigint "country_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_engineers_on_country_id"
    t.index ["team_id"], name: "index_engineers_on_team_id"
  end

  create_table "programming_languages", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "date_of_birth"
    t.string "inventor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "floor"
    t.integer "features_shipped"
    t.integer "current_bugs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookshelves", "books"
  add_foreign_key "bookshelves", "engineers"
  add_foreign_key "engineer_programming_languages", "engineers"
  add_foreign_key "engineer_programming_languages", "programming_languages"
  add_foreign_key "engineers", "countries"
  add_foreign_key "engineers", "teams"
end
