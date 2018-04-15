class AddDescriptionToOpinions < ActiveRecord::Migration[5.1]
  def change
    add_column :opinions, :description, :string
  end
end
