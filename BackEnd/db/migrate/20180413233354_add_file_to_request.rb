class AddFileToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :file, :string
  end
end
