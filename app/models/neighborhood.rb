class Neighborhood < ActiveRecord::Base
	has_many :stamps
	belongs_to :cities
end
