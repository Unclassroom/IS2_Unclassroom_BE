class CreateSpecificDates < ActiveRecord::Migration[5.1]
  def change
    create_table :specific_dates do |t|
      t.date :date

      t.timestamps
    end
  end
end
