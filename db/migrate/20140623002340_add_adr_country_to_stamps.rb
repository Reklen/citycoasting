class AddAdrCountryToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_country, :string
  end
end
