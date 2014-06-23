class AddAdrLatToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_lat, :string
  end
end
