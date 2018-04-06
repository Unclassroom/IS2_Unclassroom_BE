class AddRequestAlternativeToRequest < ActiveRecord::Migration[5.1]
  def change
    add_reference :requests, :request_alternative, foreign_key: true
  end
end
