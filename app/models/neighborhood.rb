class Neighborhood < ActiveRecord::Base
	has_many :stamps
	belongs_to :cities

	# def self.by_city(city_id)
	# 	if city_id.empty?
 #      scoped
 #    else
 #      where(city_id: )
 #    end
	# end
end
