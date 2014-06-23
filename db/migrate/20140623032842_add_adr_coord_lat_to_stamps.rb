class AddAdrCoordLatToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_coord_lat, :float
  end
end
