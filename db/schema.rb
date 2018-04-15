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

ActiveRecord::Schema.define(version: 20180413233354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.bigint "head_building_id"
    t.bigint "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "students", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.string "role"
    t.index ["department_id"], name: "index_teachers_on_department_id"
  end

  create_table "type_classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

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
  add_foreign_key "teachers", "departments"
end
