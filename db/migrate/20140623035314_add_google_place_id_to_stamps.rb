class AddGooglePlaceIdToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :google_place_id, :text
  end
end
