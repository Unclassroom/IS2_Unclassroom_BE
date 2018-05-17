class AddRequestToClassroomSchedule < ActiveRecord::Migration[5.1]
  def change
    add_reference :classroom_schedules, :request, foreign_key: true
  end
end
