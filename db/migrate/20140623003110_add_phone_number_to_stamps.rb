class AddPhoneNumberToStamps < ActiveRecord::Migration
  def change
    add_column :stamps, :phone_number, :string
  end
end
