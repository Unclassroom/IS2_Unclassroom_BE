class AddEndAtMinuteToCyclicSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :cyclic_schedules, :end_at_minute, :integer
  end
end
