require_relative '../spec_helper'
require 'rover.rb'

describe Rover do
  subject(:rover) {described_class.new(2, 3, :N)}

  it "knows its coordinates" do
    expect(rover.coordinates).to eq "X:2, Y: 3, facing: N"
  end


end