class CreateSpecificRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :specific_requests do |t|
      t.references :request_alternative, foreign_key: true
      t.references :specific_schedule, foreign_key: true

      t.timestamps
    end
  end
end
