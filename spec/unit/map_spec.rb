require 'map.rb'

describe Map do

  subject(:map) {described_class.new(5,6)}

  it "states coordinates beyond the map's size are not reachable" do
    expect(map.reachable?(8,8)).to eq false
  end

  it "states negative coordinates are unreachable" do
    expect(map.reachable?(-1,-3)).to eq false
  end

  it "states a reachable spot on the map is reachable" do
    expect(map.reachable?(4,4)).to eq true
  end

end