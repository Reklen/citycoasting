class AddRankToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :rank, :integer
  end
end
