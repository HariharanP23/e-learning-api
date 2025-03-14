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

ActiveRecord::Schema[7.2].define(version: 2025_03_11_152311) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.boolean "is_read", default: false
    t.bigint "course_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_announcements_on_author_id"
    t.index ["course_id"], name: "index_announcements_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.string "department", null: false
    t.string "course_code"
    t.string "status", default: "active", null: false
    t.bigint "term_id", null: false
    t.bigint "instructor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
    t.index ["term_id"], name: "index_courses_on_term_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_terms_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.string "role", null: false
    t.string "active", default: "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "announcements", "courses"
  add_foreign_key "announcements", "users", column: "author_id"
  add_foreign_key "courses", "terms"
  add_foreign_key "courses", "users", column: "instructor_id"
end
