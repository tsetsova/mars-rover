require 'mission_control.rb'
require 'plateau.rb'

describe MissionControl do
  subject(:mission_control) {described_class.new(terrain: Plateau.new(5,5), rover: Rover)}

  before(:each) do
    mission_control.land(1, 2, :N)
  end

  it "instructs the landing of a rover" do
    expect(mission_control.map).to eq [[:O,:O,:O,:O,:O],
                                       [:O,:O,:O,:O,:O],
                                       [:O,:X,:O,:O,:O],
                                       [:O,:O,:O,:O,:O],
                                       [:O,:O,:O,:O,:O]];
  end

  it "instructs a rover to turn left" do
    expect(mission_control.navigate(:L)).to eq("1 2 E")
  end

  it "instructs a rover to turn right" do
    expect(mission_control.navigate(:R)).to eq("1 2 W")
  end
end