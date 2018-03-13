class CreateSchemas < ActiveRecord::Migration[5.1]
  def change
    create_table :schemas do |t|
      
      t.references :classroom, foreign_key: true
      t.references :schedule, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
