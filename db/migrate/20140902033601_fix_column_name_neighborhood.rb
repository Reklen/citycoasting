class FixColumnNameNeighborhood < ActiveRecord::Migration
  def change
  	rename_column :stamps, :neighborhood, :neighborhood_id
  end
end
