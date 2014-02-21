class Checkin < ActiveRecord::Base
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode,  :if => :latitude_changed? or :longitude_changed?
end
