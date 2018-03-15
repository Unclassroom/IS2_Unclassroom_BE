class CreateClassroomEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :classroom_events do |t|
      t.references :event, foreign_key: true
      t.references :specific_schedule, foreign_key: true
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
