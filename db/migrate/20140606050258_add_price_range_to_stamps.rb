class AddPriceRangeToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :price_range, :integer
  end
end
