class DropTimeZone < ActiveRecord::Migration[5.1]
  def change
    execute "DROP TABLE #{:time_zones} CASCADE"
  end
end
