require 'rover.rb'

describe Rover do
  subject(:rover) { described_class.new(2, 3, :N, map: map) }
  let(:map) { double(:map, target_coordinates: {x: 3, y: 3}) }

  it "returns its' initial coordinates" do
    expect(rover.coordinates).to eq "2 3 N"
  end

  it "can turn one right" do
    rover.turn(:R)
    expect(rover.coordinates).to eq "2 3 E"
  end

  it "can turn one left" do
    rover.turn(:L)
    expect(rover.coordinates).to eq "2 3 W"
  end

  it "can do a full circle" do
    rover.turn(:R)
    rover.turn(:R)
    rover.turn(:R)
    rover.turn(:R)
    expect(rover.coordinates).to eq "2 3 N"
  end

  it "can move" do
    rover.move
    expect(rover.coordinates).to eq "3 3 N"
  end
end