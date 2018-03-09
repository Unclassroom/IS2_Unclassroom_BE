class CreateScheduleRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_requests do |t|
      t.integer :day
      t.time :begin_at
      t.time :end_at
      t.boolean :cyclic
      t.references :request_alternatives, foreign_key: true

      t.timestamps
    end
  end
end
