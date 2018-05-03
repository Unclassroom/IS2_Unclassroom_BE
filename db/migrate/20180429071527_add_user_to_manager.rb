class AddUserToManager < ActiveRecord::Migration[5.1]
  def change
    add_reference :managers, :user, foreign_key: true
  end
end
