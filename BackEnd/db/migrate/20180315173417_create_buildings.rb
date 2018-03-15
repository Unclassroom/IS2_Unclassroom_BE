class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.references :head_building, foreign_key: true
      t.references :faculty, foreign_key: true

      t.timestamps
    end
  end
end
