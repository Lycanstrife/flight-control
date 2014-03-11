class Plane

	def initialize
		@flying = true
	end

	def fly
		@flying
	end

	def land
		@flying = false
	end

	def take_off
		@flying = true
	end
	
end