class MissionControl

  attr_reader :map

  def initialize(terrain: Plateau.new(x,y), rover: Rover)
    @map = terrain.map
    @rovers = []
  end

  def land(x, y, direction)
    add_to_map(x, y)
    @rover = Rover.new(x, y, direction)
    @rovers.push(@rover)
  end

  def navigate(command)
    if command == :L
      @rover.turn_left
    elsif command == :R
      @rover.turn_right
    elsif command == :M
      @rover.move
    else
      raise("Invalid command")
    end
  end

  private

  def add_to_map(x, y)
    @map[y][x] = :X
  end
end