class AddRoleToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :role, :string
  end
end
