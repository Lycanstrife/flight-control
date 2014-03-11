require './lib/plane'

describe Plane do
	
	let(:plane) {Plane.new}

	it "should be flying when initialised" do
		expect(plane.fly).to eq(true)
	end

	it "should be able to land" do
		plane.land
		expect(plane.fly).to eq(false)
	end

	it "should be able to take off" do
		plane.land
		plane.take_off
		expect(plane.fly).to eq(true)
	end

end