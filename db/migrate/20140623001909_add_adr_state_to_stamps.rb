class AddAdrStateToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :adr_state, :string
  end
end
