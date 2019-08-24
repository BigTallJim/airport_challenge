require "airport.rb"

describe Airport do
  it "Test allow airplane to land at airport" do
    plane1 = Plane.new
    expect(subject.land_plane(plane1)).to eq ([plane1])
  end

  it "Test allows a plane to take off and confirm its not in the airport" do
    plane1 = Plane.new
    subject.land_plane(plane1)
    expect(subject.takeoff_plane(plane1)).to eq (false)
  end

  it "Test arrived plane is at the airport" do
    plane1 = Plane.new
    subject.land_plane(plane1)
    expect(subject.plane_in_airport?(plane1)).to eq(true)
  end

  it "Test plane is not at the airport" do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land_plane(plane1)
    expect(subject.plane_in_airport?(plane2)).to eq(false)
  end

  it "Checks the weather returns true when 0% chance of storm" do
    airport = Airport.new(0)
    expect(airport.is_it_sunny?).to eq(true)
  end

  it "Checks the weather returns false when 100% chance of storm" do
    airport = Airport.new(100)
    expect(airport.is_it_sunny?).to eq(false)
  end
end
