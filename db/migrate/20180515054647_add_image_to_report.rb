class AddImageToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :image, :string
  end
end
