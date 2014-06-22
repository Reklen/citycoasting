class AddAdrRouteToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_route, :string
  end
end
