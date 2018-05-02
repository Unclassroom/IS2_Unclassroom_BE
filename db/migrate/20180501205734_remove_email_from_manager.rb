class RemoveEmailFromManager < ActiveRecord::Migration[5.1]
  def change
    remove_column :managers, :email, :string
  end
end
