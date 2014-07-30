class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :stamps, :category, :category_id
  end
end
