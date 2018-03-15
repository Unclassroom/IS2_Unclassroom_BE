class DropTables < ActiveRecord::Migration[5.1]
  def change
    execute "DROP TABLE #{:managers} CASCADE"
    execute "DROP TABLE #{:reports} CASCADE"
    execute "DROP TABLE #{:requests} CASCADE"
    execute "DROP TABLE #{:schedules} CASCADE"
    execute "DROP TABLE #{:schemas} CASCADE"
    execute "DROP TABLE #{:students} CASCADE"
    execute "DROP TABLE #{:teachers} CASCADE"
  end
end
