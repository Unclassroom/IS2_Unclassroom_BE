class RemoveEndAtFromSpecificSchedules < ActiveRecord::Migration[5.1]
  def change
    remove_column :specific_schedules, :end_at, :time
  end
end
