class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :subject, foreign_key: true
      t.integer :number
<<<<<<< HEAD:BackEnd/db/migrate/20180315173420_create_groups.rb
      
=======

>>>>>>> 8276ba3f651ccb31c65970232cc6aa7208fcd126:BackEnd/db/migrate/20180320151244_create_groups.rb
      t.timestamps
    end
  end
end
