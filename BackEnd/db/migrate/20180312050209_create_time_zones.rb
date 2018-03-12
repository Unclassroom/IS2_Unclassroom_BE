class CreateTimeZones < ActiveRecord::Migration[5.1]
  def change
    create_table :time_zones do |t|
      t.integer :id
      t.time :begin_at
      t.time :end_at

      t.timestamps
    end
  end
end
