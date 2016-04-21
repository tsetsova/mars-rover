require_relative '../spec_helper'
require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(2, 3, :N)}

  it "knows its coordinates" do
    expect(rover.coordinates).to eq "X:2, Y: 3, facing: N"
  end

  it "can turn right" do
    rover.turn_right
    expect(rover.coordinates).to eq "X:2, Y: 3, facing: W"
    rover.turn_right
    expect(rover.coordinates).to eq "X:2, Y: 3, facing: S"
  end

  it "can turn left" do
    rover.turn_left
    expect(rover.coordinates).to eq "X:2, Y: 3, facing: E"
    rover.turn_left
    expect(rover.coordinates).to eq "X:2, Y: 3, facing: S"
  end
end