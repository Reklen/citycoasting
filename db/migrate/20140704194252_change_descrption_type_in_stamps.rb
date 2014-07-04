class ChangeDescrptionTypeInStamps < ActiveRecord::Migration
  def change
  	change_column :stamps, :description, :text
  end
end
