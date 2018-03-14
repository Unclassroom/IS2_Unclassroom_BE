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

ActiveRecord::Schema.define(version: 20180312050254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.bigint "head_building_id"
    t.bigint "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_buildings_on_faculty_id"
    t.index ["head_building_id"], name: "index_buildings_on_head_building_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.bigint "type_classroom_id"
    t.bigint "purpose_classroom_id"
    t.bigint "building_id"
    t.bigint "deparment_id"
    t.integer "capacity"
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_classrooms_on_building_id"
    t.index ["deparment_id"], name: "index_classrooms_on_deparment_id"
    t.index ["purpose_classroom_id"], name: "index_classrooms_on_purpose_classroom_id"
    t.index ["schedule_id"], name: "index_classrooms_on_schedule_id"
    t.index ["type_classroom_id"], name: "index_classrooms_on_type_classroom_id"
  end

  create_table "deparments", force: :cascade do |t|
    t.bigint "faculty_id"
    t.string "name"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faculty_id"], name: "index_deparments_on_faculty_id"
    t.index ["teacher_id"], name: "index_deparments_on_teacher_id"
  end

  create_table "external_people", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "e_mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "head_buildings", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "e_mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "e_mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opinions", force: :cascade do |t|
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_opinions_on_schedule_id"
  end

  create_table "purpose_classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string "description", limit: 500
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_reports_on_schedule_id"
  end
  
  create_table "requests", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "purpose_classroom_id"
    t.bigint "type_classroom_id"
    t.bigint "external_person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_person_id"], name: "index_requests_on_external_person_id"
    t.index ["purpose_classroom_id"], name: "index_requests_on_purpose_classroom_id"
    t.index ["teacher_id"], name: "index_requests_on_teacher_id"
    t.index ["type_classroom_id"], name: "index_requests_on_type_classroom_id"
  end

  create_table "schedule_requests", force: :cascade do |t|
    t.integer "day"
    t.time "begin_at"
    t.time "end_at"
    t.boolean "cyclic"
    t.bigint "request_alternatives_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_alternatives_id"], name: "index_schedule_requests_on_request_alternatives_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "day"
    t.time "begin_at"
    t.time "end_at"
    t.boolean "cyclic"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_schedules_on_subject_id"
  end

  create_table "schemas", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "schedule_id"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_schemas_on_classroom_id"
    t.index ["schedule_id"], name: "index_schemas_on_schedule_id"
    t.index ["subject_id"], name: "index_schemas_on_subject_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "cc"
    t.string "first_name"
    t.string "last_name"
    t.string "e_mail"
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
    t.string "e_mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_zones", force: :cascade do |t|
    t.time "begin_at"
    t.time "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "buildings", "faculties"
  add_foreign_key "buildings", "head_buildings"
  add_foreign_key "classrooms", "buildings"
  add_foreign_key "classrooms", "deparments"
  add_foreign_key "classrooms", "purpose_classrooms"
  add_foreign_key "classrooms", "schedules"
  add_foreign_key "classrooms", "type_classrooms"
  add_foreign_key "deparments", "faculties"
  add_foreign_key "deparments", "teachers"
  add_foreign_key "opinions", "schedules"
  add_foreign_key "reports", "schedules"
  add_foreign_key "request_alternatives", "requests"
  add_foreign_key "requests", "external_people"
  add_foreign_key "requests", "purpose_classrooms"
  add_foreign_key "requests", "teachers"
  add_foreign_key "requests", "type_classrooms"
  add_foreign_key "schedule_requests", "request_alternatives", column: "request_alternatives_id"
  add_foreign_key "schedules", "subjects"
  add_foreign_key "schemas", "classrooms"
  add_foreign_key "schemas", "schedules"
  add_foreign_key "schemas", "subjects"
end
