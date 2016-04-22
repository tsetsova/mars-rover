require_relative '../spec_helper'
require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(2, 3, :N)}

  it "knows its coordinates" do
    expect(rover.coordinates).to eq "2 3 N"
  end

  it "can turn right" do
    rover.turn_right
    expect(rover.coordinates).to eq "2 3 W"
    rover.turn_right
    expect(rover.coordinates).to eq "2 3 S"
  end

  it "can turn left" do
    rover.turn_left
    expect(rover.coordinates).to eq "2 3 E"
    rover.turn_left
    expect(rover.coordinates).to eq "2 3 S"
  end

  it "can turn move one forward" do
    rover.forward
    expect(rover.coordinates).to eq "2 4 N"
  end

  it "can turn move one right" do
    rover.turn_right
    rover.forward
    expect(rover.coordinates).to eq "3 3 W"
  end

  it "can turn move one left" do
    rover.turn_left
    rover.forward
    expect(rover.coordinates).to eq "1 3 E"
  end

  it "can turn move one backwards" do
    rover.turn_left
    rover.turn_left
    rover.forward
    expect(rover.coordinates).to eq "2 2 S"
  end
end