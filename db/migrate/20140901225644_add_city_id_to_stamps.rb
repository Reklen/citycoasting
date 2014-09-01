class AddCityIdToStamps < ActiveRecord::Migration
  def change
  	add_column :stamps, :city_id, :integer
    add_index :stamps, :city_id
  end
end
