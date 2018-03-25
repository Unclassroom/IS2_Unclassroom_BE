class DropAllTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :specific_requests
    drop_table :cyclic_requests
    drop_table :request_alternatives
    drop_table :requests
    drop_table :reports
    drop_table :opinions
    #drop_table :departments
    drop_table :classroom_events
    drop_table :classroom_schedules
    drop_table :groups
    drop_table :classrooms
    drop_table :specific_schedules
    drop_table :cyclic_schedules
    drop_table :events
    drop_table :buildings
    drop_table :head_buildings
    drop_table :deparments
    drop_table :faculties
    drop_table :external_people
    drop_table :teachers
    drop_table :students
    drop_table :managers
    drop_table :type_classrooms
    drop_table :subjects
    drop_table :purpose_classrooms
  end
end
