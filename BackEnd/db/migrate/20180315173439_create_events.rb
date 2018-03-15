class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description, limit: 200

      t.timestamps
    end
  end
end
