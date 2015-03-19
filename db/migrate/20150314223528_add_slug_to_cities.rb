class AddSlugToCities < ActiveRecord::Migration
  def change
  	add_column :cities, :slug, :string, uniqueness: true
  end
end
