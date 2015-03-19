class City < ActiveRecord::Base
	has_many :stamps
	has_many :neighborhoods
	
	extend FriendlyId
  friendly_id :name, use: :slugged
end
