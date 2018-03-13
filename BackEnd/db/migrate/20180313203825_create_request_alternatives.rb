class CreateRequestAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :request_alternatives do |t|
      t.integer :id

      t.timestamps
    end
  end
end
