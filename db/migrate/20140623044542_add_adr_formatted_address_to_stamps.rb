class AddAdrFormattedAddressToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :formatted_address, :string
  end
end
