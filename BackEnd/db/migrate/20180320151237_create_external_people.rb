class CreateExternalPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :external_people do |t|
      t.integer :cc
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
