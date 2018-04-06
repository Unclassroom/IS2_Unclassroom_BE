class CreatePurposeClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :purpose_classrooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
