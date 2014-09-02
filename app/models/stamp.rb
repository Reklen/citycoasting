class Stamp < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :city
	belongs_to :neighborhood


	has_reputation :votes, source: :user, aggregated_by: :sum



	has_attached_file :image, :styles => { :large => "600x400#", :rendered => "500x350#", :rendered2 => "500x400#", :medium => "300x300#" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :description, presence: true
	validates :image, presence: true
	validates :category, presence: true
	validates :price_range, presence: true

end
