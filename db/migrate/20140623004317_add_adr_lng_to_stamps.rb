class AddAdrLngToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_lng, :string
  end
end
