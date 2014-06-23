class AddAdrPostalCodeToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_postal_code, :string
  end
end
