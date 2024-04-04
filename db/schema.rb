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

ActiveRecord::Schema[7.1].define(version: 2024_04_04_162301) do
  create_table "character_tags", force: :cascade do |t|
    t.integer "characters_id", null: false
    t.integer "tags_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["characters_id"], name: "index_character_tags_on_characters_id"
    t.index ["tags_id"], name: "index_character_tags_on_tags_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "style"
    t.string "name"
    t.string "description"
    t.string "gender"
    t.string "homeland"
    t.string "skin_color"
    t.string "hair_color"
    t.string "likes"
    t.string "dislikes"
    t.string "portrait"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "character_tags", "characters", column: "characters_id"
  add_foreign_key "character_tags", "tags", column: "tags_id"
end
