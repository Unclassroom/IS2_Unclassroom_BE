class AddBeginAtHourToCyclicSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :cyclic_schedules, :begin_at_hour, :integer
  end
end
