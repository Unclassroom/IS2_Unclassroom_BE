class AddNumberToBuilding < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :number, :integer
  end
end
