class City < ActiveRecord::Base
	has_many :stamps
	has_many :neighborhoods

	def city_header_img(city_id)
		case city_id
		when 1
		when 2
		when 3
		when 4
		when 5
		when 6
		when 7
		when 8
		when 9
		when 10
		when 11
		when 12
		when 13
		when 14
		when 15
		when 16
		end
	end
	
	extend FriendlyId
  friendly_id :name, use: :slugged
end
