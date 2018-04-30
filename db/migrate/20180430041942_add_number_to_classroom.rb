class AddNumberToClassroom < ActiveRecord::Migration[5.1]
  def change
    add_column :classrooms, :number, :integer
  end
end
