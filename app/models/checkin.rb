class Checkin < ActiveRecord::Base
	belongs_to :location
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode,  :if => :latitude_changed? or :longitude_changed?
	#after_create :check_and_set_location

	def verified_location
			self.location.blank? ? 'none' : self.location.address
	end

	protected

	# def check_and_set_location
	# 	locations = Location.near([self.latitude,self.longitude], 2);
	# 	self.location = locations.first unless locations.empty?
	# end
end
