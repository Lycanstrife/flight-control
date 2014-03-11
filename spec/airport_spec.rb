require './lib/airport'
require './lib/plane'
 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  it "should initialise with no planes" do
    expect(airport).to be_empty
  end

  it "should know when it's full" do
    airport.stub(:weather => "sunny" )
    expect(airport).not_to be_full
    airport.capacity.times {airport.land_plane(plane)}
    expect(airport).to be_full
  end

  it "should not allow planes to land if full" do
    airport.stub(:weather => "sunny")
    airport.capacity.times {airport.land_plane(plane)}
    expect{airport.land_plane(plane)}.to raise_error(RuntimeError)
  end

  it "should not allow planes to take off if empty" do
    airport.stub(:weather => "sunny")
    expect{airport.take_off_plane(plane)}.to raise_error(RuntimeError)
  end

  context "take off and landing in sunny weather" do

    it "a plane can land" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      expect(airport.planes).to eq([plane])
    end

    it "a plane should not be flying when it lands" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      expect(plane.fly).to eq(false)
    end

    it "a plane can take off in sunny weather" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      airport.take_off_plane(plane)
      expect(airport).to be_empty
    end

    it "a plane should fly when it takes off" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      airport.take_off_plane(plane)
      expect(plane.fly).to be(true)
    end
  end
  
  context "taking off and landing in stormy weather" do

    it "a plane cannot land in stormy weather" do
      airport.stub(:weather => "stormy")
      expect{airport.land_plane(plane)}.to raise_error(RuntimeError)
    end

    it "a plane cannot take off in stormy weather" do
      airport.stub(:weather => "sunny")
      airport.land_plane(plane)
      airport.stub(:weather => "stormy")
      expect{airport.take_off_plane(plane)}.to raise_error(RuntimeError)
    end

  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
    end
  end
end
 
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
  end
  
  it 'has a flying status when in the air' do
  end
  
  it 'can take off' do
  end
  
  it 'changes its status to flying after taking of' do
  end
end
 
# grand finale
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The grand finale (last spec)" do
  it 'all planes can land and all planes can take off' do
  end
end