class CreateCyclicDates < ActiveRecord::Migration[5.1]
  def change
    create_table :cyclic_dates do |t|
      t.integer :day

      t.timestamps
    end
  end
end
