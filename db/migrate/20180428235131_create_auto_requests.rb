class CreateAutoRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :auto_requests do |t|
      t.string :file

      t.timestamps
    end
  end
end
