class CreateHeadBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :head_buildings do |t|
      t.integer :cc
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
