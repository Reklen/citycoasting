class AddAdrCoordLngToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_coord_lng, :float
  end
end
