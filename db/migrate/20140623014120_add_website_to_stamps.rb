class AddWebsiteToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :website, :string
  end
end
