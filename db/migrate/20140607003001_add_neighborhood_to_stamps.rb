class AddNeighborhoodToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :neighborhood, :integer
  end
end
