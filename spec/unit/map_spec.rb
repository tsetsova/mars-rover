require 'map.rb'

describe Map do

  subject(:map) { described_class.new(width: 5, height: 6) }

  it "can't move off the edge of the map" do
    expect{ map.target_coordinates(0,0, :S) }.to raise_error "Coordinates lead outside of map limits"
  end

  it "can't move off the edge of the map" do
    expect{ map.target_coordinates(0,0, :W) }.to raise_error "Coordinates lead outside of map limits"
  end

  it "can turn move one north" do
    expect(map.target_coordinates(1, 1, :N)).to eq({x: 1, y: 2})
  end

  it "can turn move one east" do
    expect(map.target_coordinates(1, 1, :E)).to eq({x: 2, y: 1})
  end

  it "can turn move one south" do
    expect(map.target_coordinates(1, 1, :S)).to eq({x: 1, y: 0})
  end

  it "can turn move one west" do
    expect(map.target_coordinates(1, 1, :W)).to eq({x: 0, y: 1})
  end
end