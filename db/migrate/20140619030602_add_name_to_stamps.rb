class AddNameToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :name, :string
  end
end
