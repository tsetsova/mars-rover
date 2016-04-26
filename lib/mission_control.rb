class MissionControl

COMMANDS = [:L, :R, :M].freeze

  def initialize(rover_class: Rover, map: Map.new(width: width, height:height))
    @map = map
    @rover_class = rover_class
  end

  def land(x, y, direction)
    @rover = @rover_class.new(x, y, direction, map: @map)
  end

  def send(commands)
    commands.map{|command| navigate(command)}
  end

  def coordinates
    @rover.coordinates
  end

  def navigate(command)
    raise "Invalid command: #{command}" unless COMMANDS.include?(command)
    if command == :M
      @rover.move
    else
      @rover.turn(command)
    end
  end
end