require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(2, 3, :N, map: Map.new(width: 5, height: 5))}

  it "can turn right" do
    rover.turn(:R)
    rover.turn(:R)
    expect(rover.coordinates).to eq "2 3 S"
  end

  it "can turn left" do
    rover.turn(:L)
    rover.turn(:L)
    expect(rover.coordinates).to eq "2 3 S"
  end

  it "can turn move one forward" do
    rover.move
    expect(rover.coordinates).to eq "2 4 N"
  end

  it "can turn move one right" do
    rover.turn(:R)
    rover.move
    expect(rover.coordinates).to eq "3 3 E"
  end

  it "can turn move one left" do
    rover.turn(:L)
    rover.move
    expect(rover.coordinates).to eq "1 3 W"
  end

  it "can turn move one backwards" do
    rover.turn(:L)
    rover.turn(:L)
    rover.move
    expect(rover.coordinates).to eq "2 2 S"
  end

  it "can't move off the edge of the map" do
    2.times{rover.move}
    expect{rover.move}.to raise_error "Coordinates lead outside of map limits"
  end
end