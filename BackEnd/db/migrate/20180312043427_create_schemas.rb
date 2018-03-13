class CreateSchemas < ActiveRecord::Migration[5.1]
  def change
    create_table :schemas do |t|
      t.integer :id
      t.references :classroom_id, foreign_key: true
      t.references :schedule_id, foreign_key: true
      t.references :subject_id, foreign_key: true

      t.timestamps
    end
  end
end
