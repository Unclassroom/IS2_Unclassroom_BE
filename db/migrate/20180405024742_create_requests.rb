class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :purpose_classroom, foreign_key: true
      t.references :type_classroom, foreign_key: true
      t.string :state
      t.references :requestable, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
