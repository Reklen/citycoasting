class Stamp < ActiveRecord::Base
	belongs_to :user


	has_attached_file :image, :styles => { :large => "600#x400#", :medium => "300#x300#",:thumber => "300#x200#", :thumb => "100#x100#" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :description, presence: true
	validates :image, presence: true
	validates :category, presence: true
	validates :price_range, presence: true
	validates :neighborhood, presence: true
end
