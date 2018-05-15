class CreateOpinions < ActiveRecord::Migration[5.1]
  def change
    create_table :opinions do |t|
      t.references :classroom_schedule, foreign_key: true
      t.references :opinable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
