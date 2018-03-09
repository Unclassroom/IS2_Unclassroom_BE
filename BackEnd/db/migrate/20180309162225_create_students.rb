class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.integer :cc
      t.string :first_name
      t.string :last_name
      t.string :e_mail

      t.timestamps
    end
  end
end
