class RemoveEmailFromTeacher < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :email, :string
  end
end
