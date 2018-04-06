class AddBuildingToHeadBuilding < ActiveRecord::Migration[5.1]
  def change
    add_reference :head_buildings, :building, foreign_key: true
  end
end
