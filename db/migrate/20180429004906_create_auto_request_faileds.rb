class CreateAutoRequestFaileds < ActiveRecord::Migration[5.1]
  def change
    create_table :auto_request_faileds do |t|
      t.references :auto_request, foreign_key: true
      t.string :code
      t.string :group
      t.string :day
      t.string :time
      t.string :building
      t.string :classroom

      t.timestamps
    end
  end
end
