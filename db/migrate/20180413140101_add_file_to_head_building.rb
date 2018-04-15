class AddFileToHeadBuilding < ActiveRecord::Migration[5.1]
  def change
    add_column :head_buildings, :file, :string
  end
end
