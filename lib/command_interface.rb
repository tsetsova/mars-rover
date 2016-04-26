require "stringio"

class CommandInterface
  def initialize(input=$stdin,output=$stdout, mission_class: MissionControl)
    @output = output
    @input = input
    @mission_control = mission_class.new(map: create_map)
    command_rover
    command_rover
  end

  def command_rover
    create_rover
    navigate_rover
    @output.puts @mission_control.coordinates
  end

  private

  def create_rover
    landing_input = @input.gets.chomp.split(" ")
    x = landing_input[0].to_i
    y = landing_input[1].to_i
    direction = landing_input[2].to_sym
    @mission_control.land(x, y, direction)
  end

  def navigate_rover
    commands = @input.gets.chomp.split("").map(&:to_sym)
    @mission_control.send(commands)
  end


  def create_map
    map_dimensions = @input.gets.chomp.split(" ").map(&:to_i)
    Map.new(width: map_dimensions[0], height: map_dimensions[1])
  end

end