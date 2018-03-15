class CreateCyclicRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :cyclic_requests do |t|
      t.references :request_alternative, foreign_key: true
      t.references :cyclic_schedule, foreign_key: true

      t.timestamps
    end
  end
end
