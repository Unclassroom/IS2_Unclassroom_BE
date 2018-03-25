class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :subject, foreign_key: true
      t.integer :number
      
      t.timestamps
    end
  end
end
