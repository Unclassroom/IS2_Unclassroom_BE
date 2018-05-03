class AddClassroomIdToOpinion < ActiveRecord::Migration[5.1]
  def change
    add_reference :opinions, :classroom, foreign_key: true
  end
end
