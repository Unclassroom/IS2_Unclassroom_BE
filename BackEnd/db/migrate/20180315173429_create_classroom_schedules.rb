class CreateClassroomSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :classroom_schedules do |t|
      t.references :classroom, foreign_key: true
      t.references :group, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
