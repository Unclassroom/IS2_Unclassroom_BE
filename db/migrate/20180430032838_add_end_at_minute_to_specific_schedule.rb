class AddEndAtMinuteToSpecificSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :specific_schedules, :end_at_minute, :integer
  end
end
