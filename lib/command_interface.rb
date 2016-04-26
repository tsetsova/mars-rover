require "stringio"

class CommandInterface
  def initialize(input=$stdin, output=$stdout,  mission_class: MissionControl)
    @output = output
    @input = input
    @mission_class = mission_class
  end

  def run
    generate_mission_control
    print_rover_final_coordinates
  end

  private

  def generate_mission_control
    @mission_control = @mission_class.new(map: create_map)
  end

  def print_rover_final_coordinates
    loop do
      coordinates = @input.gets
      directions = @input.gets
      break if coordinates.nil? || directions.nil?

      deploy_rover(coordinates, directions)
      @output.puts @mission_control.latest_rover_coordinates
    end
  end

  def deploy_rover(coordinates, directions)
    create_rover(coordinates.chomp)
    navigate_rover(directions.chomp)
  end

  def create_rover(coordinates)
    x, y, direction = coordinates.split(" ")
    @mission_control.land(x.to_i, y.to_i, direction.to_sym)
  end

  def navigate_rover(directions)
    commands = directions.split("").map(&:to_sym)
    @mission_control.transmit(commands)
  end

  def create_map
    width, height = @input.gets.chomp.split(" ").map(&:to_i)
    Map.new(width: width, height: height)
  end
end