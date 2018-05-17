class AddRequestToClassroomEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :classroom_events, :request, foreign_key: true
  end
end
