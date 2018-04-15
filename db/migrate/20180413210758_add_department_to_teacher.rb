class AddDepartmentToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_reference :teachers, :department, foreign_key: true
  end
end
