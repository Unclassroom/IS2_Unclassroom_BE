class AddTeacherMotiveToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests, :motive, :text
  end
end
