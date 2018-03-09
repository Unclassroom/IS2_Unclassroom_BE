class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :teacher, foreign_key: true
      t.references :purpose_classroom, foreign_key: true
      t.references :type_classroom, foreign_key: true
      t.references :external_person, foreign_key: true

      t.timestamps
    end
  end
end
