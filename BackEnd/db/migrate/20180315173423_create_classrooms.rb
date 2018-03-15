class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.references :type_classroom, foreign_key: true
      t.references :building, foreign_key: true
      t.references :deparment, foreign_key: true
      t.integer :capacity

      t.timestamps
    end
  end
end
