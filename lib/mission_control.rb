class MissionControl

COMMANDS = [:L, :R, :M].freeze

  def initialize(rover_class: Rover, map:)
    @map = map
    @rover_class = rover_class
  end

  def land(x, y, direction)
    @rover = @rover_class.new(x, y, direction, map: @map)
  end

  def transmit(commands)
    commands.map{ |command| navigate(command) }
  end

  def latest_rover_coordinates
    @rover.coordinates
  end

  def navigate(command)
    raise "Invalid command: #{command}" unless COMMANDS.include?(command)

    command == :M ? @rover.move : @rover.turn(command)
  end
end