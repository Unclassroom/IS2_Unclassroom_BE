class CreateCyclicSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :cyclic_schedules do |t|
      t.integer :day
      t.time :begin_at
      t.time :end_at

      t.timestamps
    end
  end
end
