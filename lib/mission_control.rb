class MissionControl

  attr_reader :map

  def initialize(terrain: Plateau.new(x,y), rover: Rover)
    @map = terrain.map
    @rovers = []
  end

  def land(x, y, direction)
    add_to_map(x, y)
    @rovers.push(Rover.new(x, y, direction))
  end

  private

  def add_to_map(x, y)
    @map[y][x] = :X
  end
end