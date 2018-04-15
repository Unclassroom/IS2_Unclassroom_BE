class RemoveTeacherFromDepartment < ActiveRecord::Migration[5.1]
  def change
    remove_reference :departments, :teacher, foreign_key: true
  end
end
