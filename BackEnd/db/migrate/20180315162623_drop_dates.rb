class DropDates < ActiveRecord::Migration[5.1]
  def change
    execute "DROP TABLE #{:cyclic_dates} CASCADE"
    execute "DROP TABLE #{:specific_dates} CASCADE"
  end
end
