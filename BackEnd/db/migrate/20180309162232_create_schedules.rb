class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :day
      t.time :begin_at
      t.time :end_at
      t.boolean :cyclic
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
