class AddSlugToStamp < ActiveRecord::Migration
  def change
    add_column :stamps, :slug, :string
    add_index :stamps, :slug, unique: true
  end
end
