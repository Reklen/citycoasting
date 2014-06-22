class AddAdrStreetNumberToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_street_number, :string
  end
end
