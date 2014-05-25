class AddUserIdToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :user_id, :integer
    add_index :stamps, :user_id
  end
end
