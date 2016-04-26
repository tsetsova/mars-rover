require 'command_interface'
require 'mission_control'
require 'map.rb'
require 'rover'
require 'spec_helper'
require 'stringio'

describe CommandInterface do

  let(:commands) do
    <<-EOS
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
    EOS
  end

  let(:input) { StringIO.new(commands) }
  let(:output) { StringIO.new }

  it "commands a rover succesfully" do
    CommandInterface.new(input, output).run
    expect(output.string).to include("1 3 N")
    expect(output.string).to include("5 1 E")
  end
end
