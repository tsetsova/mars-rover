require 'map.rb'

describe Map do

  subject(:map) {described_class.new(width: 5, height: 6)}

  it "states coordinates beyond the map's size are not reachable" do
    expect(map.movement_is_possible?(8,8)).to eq false
  end

  it "states negative coordinates are unreachable" do
    expect(map.movement_is_possible?(-1,-3)).to eq false
  end

  it "states a reachable spot on the map is reachable" do
    expect(map.movement_is_possible?(4,4)).to eq true
  end

end