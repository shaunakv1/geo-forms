class Checkin < ActiveRecord::Base
	belongs_to :location
	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode,  :if => :latitude_changed? or :longitude_changed?
	default_scope order('created_at DESC')

	def verified_location
			self.location.blank? ? 'none' : self.location.address
	end
	
	def verified_location_class
			markup = self.location.blank? ? "<div class='red'> <i class='fa fa-times'></i> Unverified Location</div>" : "<div class='green'> <i class='fa fa-check'></i> Verified Location</div>"
			markup.html_safe
	end

	def screen_name
		 self.name.blank? ? 'Jane Doe' : self.name
	end
	protected

	# def check_and_set_location
	# 	locations = Location.near([self.latitude,self.longitude], 2);
	# 	self.location = locations.first unless locations.empty?
	# end
end
