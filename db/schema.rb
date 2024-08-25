# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_08_22_094318) do
  create_table "plugin_releases", force: :cascade do |t|
    t.string "code_name"
    t.integer "major"
    t.integer "minor"
    t.integer "patch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plugin_id", null: false
    t.index ["plugin_id"], name: "index_plugin_releases_on_plugin_id"
  end

  create_table "plugins", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "published"
    t.integer "major"
    t.integer "minor"
    t.integer "patch"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "plugin_releases", "plugins"
end
