class CreateSpecificSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :specific_schedules do |t|
      t.date :date
      t.time :begin_at
      t.time :end_at

      t.timestamps
    end
  end
end
