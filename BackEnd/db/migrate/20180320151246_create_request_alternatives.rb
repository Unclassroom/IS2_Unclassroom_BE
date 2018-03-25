class CreateRequestAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :request_alternatives do |t|
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
