class Stamp < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :large => "700x700>", :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :description, presence: true
	validates :image, presence: true
end
