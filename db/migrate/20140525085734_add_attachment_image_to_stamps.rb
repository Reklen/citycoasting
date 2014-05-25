class AddAttachmentImageToStamps < ActiveRecord::Migration
  def self.up
    change_table :stamps do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :stamps, :image
  end
end
