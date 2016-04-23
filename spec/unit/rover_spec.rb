require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(2, 3, :N, map: map)}
  let(:map){double(:map, movement_is_possible?: true)}

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
    expect(rover.coordinates).to eq "3 3 W"
  end

  it "can turn move one left" do
    rover.turn(:L)
    rover.move
    expect(rover.coordinates).to eq "1 3 E"
  end

  it "can turn move one backwards" do
    rover.turn(:L)
    rover.turn(:L)
    rover.move
    expect(rover.coordinates).to eq "2 2 S"
  end

  it "can't move off the edge of the map" do
    rover.move
    rover.move
    expect(rover.coordinates).to eq "2 5 N"
  end
end