require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(2, 3, :N)}

  it "can turn right" do
    expect(rover.turn_right).to eq "2 3 W"
    expect(rover.turn_right).to eq "2 3 S"
  end

  it "can turn left" do
    expect(rover.turn_left).to eq "2 3 E"
    expect(rover.turn_left).to eq "2 3 S"
  end

  it "can turn move one forward" do
    expect(rover.forward).to eq "2 4 N"
  end

  it "can turn move one right" do
    rover.turn_right
    expect(rover.forward).to eq "3 3 W"
  end

  it "can turn move one left" do
    rover.turn_left
    expect(rover.forward).to eq "1 3 E"
  end

  it "can turn move one backwards" do
    rover.turn_left
    rover.turn_left
    expect(rover.forward).to eq "2 2 S"
  end
end