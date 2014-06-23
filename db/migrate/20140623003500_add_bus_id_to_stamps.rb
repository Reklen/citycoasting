class AddBusIdToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :bus_id, :string
  end
end
