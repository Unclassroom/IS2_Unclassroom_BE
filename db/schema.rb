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

ActiveRecord::Schema.define(version: 20180501221642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auto_request_faileds", force: :cascade do |t|
    t.bigint "auto_request_id"
    t.string "code"
    t.string "group"
    t.string "day"
    t.string "time"
    t.string "building"
    t.string "classroom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auto_request_id"], name: "index_auto_request_faileds_on_auto_request_id"
  end

  create_table "auto_requests", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.bigint "head_building_id"
    t.bigint "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["faculty_id"], name: "index_buildings_on_faculty_id"
    t.index ["head_building_id"], name: "index_buildings_on_head_building_id"
  end

  create_table "classroom_events", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "specific_schedule_id"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_events_on_classroom_id"
    t.index ["event_id"], name: "index_classroom_events_on_event_id"
    t.index ["specific_schedule_id"], name: "index_classroom_events_on_specific_schedule_id"
  end

  create_table "classroom_schedules", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "group_id"
    t.bigint "cyclic_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_classroom_schedules_on_classroom_id"
    t.index ["cyclic_schedule_id"], name: "index_classroom_schedules_on_cyclic_schedule_id"
    t.index ["group_id"], name: "index_classroom_schedules_on_group_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.bigint "type_classroom_id"
    t.bigint "building_id"
    t.bigint "department_id"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["building_id"], name: "index_classrooms_on_building_id"
    t.index ["department_id"], name: "index_classrooms_on_department_id"
    t.index ["type_classroom_id"], name: "index_classrooms_on_type_classroom_id"
  end

  create_table "cyclic_requests", force: :cascade do |t|
    t.bigint "request_alternative_id"
    t.bigint "cyclic_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cyclic_schedule_id"], name: "index_cyclic_requests_on_cyclic_schedule_id"
    t.index ["request_alternative_id"], name: "index_cyclic_requests_on_request_alternative_id"
  end

  create_table "cyclic_schedules", force: :cascade do |t|
    t.integer "day"
    t.time "begin_at"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "begin_at_hour"
    t.integer "begin_at_minute"
    t.integer "end_at_hour"
    t.integer "end_at_minute"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "faculty_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "description", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_people", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.bigint "subject_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.index ["subject_id"], name: "index_groups_on_subject_id"
    t.index ["teacher_id"], name: "index_groups_on_teacher_id"
  end

  create_table "head_buildings", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
  end

  create_table "managers", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.bigint "classroom_schedule_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["classroom_schedule_id"], name: "index_opinions_on_classroom_schedule_id"
    t.index ["student_id"], name: "index_opinions_on_student_id"
  end

  create_table "purpose_classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "description", limit: 500
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_reports_on_classroom_id"
  end

  create_table "request_alternatives", force: :cascade do |t|
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_request_alternatives_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "purpose_classroom_id"
    t.bigint "type_classroom_id"
    t.bigint "external_person_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_alternative_id"
    t.text "motive"
    t.string "file"
    t.index ["external_person_id"], name: "index_requests_on_external_person_id"
    t.index ["purpose_classroom_id"], name: "index_requests_on_purpose_classroom_id"
    t.index ["request_alternative_id"], name: "index_requests_on_request_alternative_id"
    t.index ["teacher_id"], name: "index_requests_on_teacher_id"
    t.index ["type_classroom_id"], name: "index_requests_on_type_classroom_id"
  end

  create_table "specific_requests", force: :cascade do |t|
    t.bigint "request_alternative_id"
    t.bigint "specific_schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_alternative_id"], name: "index_specific_requests_on_request_alternative_id"
    t.index ["specific_schedule_id"], name: "index_specific_requests_on_specific_schedule_id"
  end

  create_table "specific_schedules", force: :cascade do |t|
    t.date "date"
    t.time "begin_at"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "begin_at_hour"
    t.integer "begin_at_minute"
    t.integer "end_at_hour"
    t.integer "end_at_minute"
  end

  create_table "students", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.string "role"
    t.bigint "user_id"
    t.index ["department_id"], name: "index_teachers_on_department_id"
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "type_classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "role", default: "user", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "auto_request_faileds", "auto_requests"
  add_foreign_key "buildings", "faculties"
  add_foreign_key "buildings", "head_buildings"
  add_foreign_key "classroom_events", "classrooms"
  add_foreign_key "classroom_events", "events"
  add_foreign_key "classroom_events", "specific_schedules"
  add_foreign_key "classroom_schedules", "classrooms"
  add_foreign_key "classroom_schedules", "cyclic_schedules"
  add_foreign_key "classroom_schedules", "groups"
  add_foreign_key "classrooms", "buildings"
  add_foreign_key "classrooms", "departments"
  add_foreign_key "classrooms", "type_classrooms"
  add_foreign_key "cyclic_requests", "cyclic_schedules"
  add_foreign_key "cyclic_requests", "request_alternatives"
  add_foreign_key "departments", "faculties"
  add_foreign_key "groups", "subjects"
  add_foreign_key "groups", "teachers"
  add_foreign_key "managers", "users"
  add_foreign_key "opinions", "classroom_schedules"
  add_foreign_key "opinions", "students"
  add_foreign_key "reports", "classrooms"
  add_foreign_key "request_alternatives", "requests"
  add_foreign_key "requests", "external_people"
  add_foreign_key "requests", "purpose_classrooms"
  add_foreign_key "requests", "request_alternatives"
  add_foreign_key "requests", "teachers"
  add_foreign_key "requests", "type_classrooms"
  add_foreign_key "specific_requests", "request_alternatives"
  add_foreign_key "specific_requests", "specific_schedules"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "departments"
  add_foreign_key "teachers", "users"
end
