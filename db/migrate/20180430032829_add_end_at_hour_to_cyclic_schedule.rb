class AddEndAtHourToCyclicSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :cyclic_schedules, :end_at_hour, :integer
  end
end
