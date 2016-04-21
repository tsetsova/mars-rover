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

  it "can turn move one forward" do
    rover.forward
    expect(rover.coordinates).to eq "X:2, Y: 4, facing: N"
  end

  it "can turn move one right" do
    rover.turn_right
    rover.forward
    expect(rover.coordinates).to eq "X:3, Y: 3, facing: W"
  end

  it "can turn move one left" do
    rover.turn_left
    rover.forward
    expect(rover.coordinates).to eq "X:1, Y: 3, facing: E"
  end

  it "can turn move one backwards" do
    rover.turn_left
    rover.turn_left
    rover.forward
    expect(rover.coordinates).to eq "X:2, Y: 2, facing: S"
  end
end