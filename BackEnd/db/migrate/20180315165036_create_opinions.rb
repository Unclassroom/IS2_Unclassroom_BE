class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.references :student, foreign_key: true
      t.references :classroom_schedule, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
