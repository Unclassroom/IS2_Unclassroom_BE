class DropExternalPeople < ActiveRecord::Migration[5.1]
  def change
    execute "DROP TABLE #{:head_buildings} CASCADE"
  end
end
