class AddCategoryToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :category, :integer
    add_index :stamps, :category
  end
end
