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

ActiveRecord::Schema[7.0].define(version: 2023_03_05_005417) do
  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "instructor_id", null: false
    t.bigint "student_id", null: false
    t.bigint "semester_id", null: false
    t.bigint "teaching_level_id", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
    t.index ["semester_id"], name: "index_courses_on_semester_id"
    t.index ["student_id"], name: "index_courses_on_student_id"
    t.index ["teaching_level_id"], name: "index_courses_on_teaching_level_id"
  end

  create_table "instructors", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.boolean "active", default: true
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "current_semester", limit: 8, null: false
    t.string "current_semester_code", limit: 2
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.string "description"
    t.string "task_note", limit: 3
    t.integer "limit_note", default: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tasks_on_course_id"
  end

  create_table "teaching_levels", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "codigo", limit: 5, null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "instructors"
  add_foreign_key "courses", "semesters"
  add_foreign_key "courses", "students"
  add_foreign_key "courses", "teaching_levels"
  add_foreign_key "tasks", "courses"
end
