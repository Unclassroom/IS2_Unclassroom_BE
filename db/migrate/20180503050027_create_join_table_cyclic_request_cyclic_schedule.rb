class CreateJoinTableCyclicRequestCyclicSchedule < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cyclic_requests, :cyclic_schedules do |t|
      # t.index [:cyclic_request_id, :cyclic_schedule_id]
      # t.index [:cyclic_schedule_id, :cyclic_request_id]
    end
  end
end
