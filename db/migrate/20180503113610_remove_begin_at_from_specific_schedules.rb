class RemoveBeginAtFromSpecificSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :specific_schedules, :begin_at, :time
  end
end
