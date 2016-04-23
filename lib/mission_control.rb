class MissionControl

  def initialize(terrain: Plateau.new(x,y), rover_class: Rover)
    @map = terrain.map
    @rovers = []
    @rover_class = rover_class
  end

  def land(x, y, direction)
    @rover = @rover_class.new(x, y, direction)
    @rovers.push(@rover)
  end

  def navigate(command)
    raise "Invalid command" unless [:L, :R, :M].include?(command)
    if command == :M
      @rover.move
    else
      @rover.turn(command)
    end
  end
end