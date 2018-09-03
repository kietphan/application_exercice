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

ActiveRecord::Schema.define(version: 20180903120956) do

  create_table "commune_streets", force: :cascade do |t|
    t.integer  "commune_id"
    t.integer  "street_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commune_id"], name: "index_commune_streets_on_commune_id"
    t.index ["street_id"], name: "index_commune_streets_on_street_id"
  end

  create_table "communes", force: :cascade do |t|
    t.string   "name"
    t.string   "code_insee"
    t.integer  "population"
    t.integer  "intercommunality_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["intercommunality_id"], name: "index_communes_on_intercommunality_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "intercommunalities", force: :cascade do |t|
    t.string   "name"
    t.string   "siren"
    t.string   "form"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["siren"], name: "index_intercommunalities_on_siren", unique: true
    t.index ["slug"], name: "index_intercommunalities_on_slug"
  end

  create_table "streets", force: :cascade do |t|
    t.string   "title"
    t.integer  "from"
    t.integer  "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
