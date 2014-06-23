class AddAdrCityToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_city, :string
  end
end
