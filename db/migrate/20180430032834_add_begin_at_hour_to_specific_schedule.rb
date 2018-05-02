class AddBeginAtHourToSpecificSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :specific_schedules, :begin_at_hour, :integer
  end
end
