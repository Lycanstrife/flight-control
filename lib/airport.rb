class Airport

	DEFAULT_CAPACITY = 20

	def planes
		@planes ||= []
	end

	def empty?
		planes.count == 0
	end

	def full?
		planes.count == capacity
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def land_plane(plane)
		raise "The Airport is full" if full?
		raise "You cannot land in stormy weather" if weather == "stormy"
		planes << plane
		plane.land
	end

	def take_off_plane(plane)
		raise "The Airport is empty" if empty?
		raise "You cannot take off in stormy weather" if weather == "stormy"
		planes.delete(plane)
		plane.take_off
	end

end