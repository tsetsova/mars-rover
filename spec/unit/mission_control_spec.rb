require 'mission_control.rb'
require 'plateau.rb'

describe MissionControl do
  subject(:mission_control) {described_class.new(terrain: Plateau.new(5,5), rover: Rover)}

  it "instructs the landing of a rover" do
    mission_control.land(1, 2, :N)
    expect(mission_control.map).to eq [[:O,:O,:O,:O,:O],
                                       [:O,:O,:O,:O,:O],
                                       [:O,:X,:O,:O,:O],
                                       [:O,:O,:O,:O,:O],
                                       [:O,:O,:O,:O,:O]];
  end
end