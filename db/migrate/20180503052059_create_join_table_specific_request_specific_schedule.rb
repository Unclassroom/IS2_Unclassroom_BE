class CreateJoinTableSpecificRequestSpecificSchedule < ActiveRecord::Migration[5.1]
  def change
    create_join_table :specific_requests, :specific_schedules do |t|
      # t.index [:specific_request_id, :specific_schedule_id]
      # t.index [:specific_schedule_id, :specific_request_id]
    end
  end
end
