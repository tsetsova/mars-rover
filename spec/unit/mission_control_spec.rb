require 'mission_control.rb'
require 'map.rb'

describe MissionControl do
  subject(:mission_control) {described_class.new(map: Map.new(width: 5, height: 5), rover_class: rover_class)}
    let(:rover_class) {double(:rover_class, new: rover)}
    let(:rover){double(:rover, turn: nil, move: nil)}

  before(:each) do
    mission_control.land(1, 2, :N)
  end

  it "instructs a rover to turn left" do
    mission_control.navigate(:L)
    expect(rover).to have_received(:turn).with(:L)
  end

  it "instructs a rover to turn right" do
    mission_control.navigate(:R)
    expect(rover).to have_received(:turn).with(:R)
  end

  it "instructs a rover to move" do
    mission_control.navigate(:M)
    expect(rover).to have_received(:move)
  end

  it "raises an error if command is invalid" do
    expect{mission_control.navigate(:S)}.to raise_error("Invalid command #{:S}")
  end
end