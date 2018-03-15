class DropClassrooms < ActiveRecord::Migration[5.1]
  def change
    execute "DROP TABLE #{:classrooms} CASCADE"
  end
end
