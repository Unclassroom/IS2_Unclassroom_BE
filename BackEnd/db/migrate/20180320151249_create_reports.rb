class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :description, limit: 500
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
