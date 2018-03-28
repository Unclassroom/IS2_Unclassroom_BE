class AddUserToHeadBuilding < ActiveRecord::Migration[5.1]
  def change
    add_reference :head_buildings, :user, foreign_key: true
  end
end
