class City < ActiveRecord::Base
	has_many :stamps
	has_many :neighborhoods
end
