class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.string :name
      t.boolean :cyclic
      t.date :number_day

      t.timestamps
    end
  end
end
