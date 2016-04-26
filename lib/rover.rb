class Rover

  def initialize(x, y, direction, map: Map.new(width: width, height: height))
    @x = x
    @y = y
    @direction = direction
    @map = map
    @map_directions = Map::DIRECTIONS.keys
  end

  def coordinates
    "#{@x} #{@y} #{@direction}"
  end

  def move
    coordinates = @map.target_coordinates(@x, @y, @direction)
    @x = coordinates[:x]
    @y = coordinates[:y]
  end

  def turn(command)
    @direction =  @map_directions[determine_direction(command)]
  end

private

  def determine_direction(command)
    index = @map_directions.find_index(@direction)
    return (index + 1) % @map_directions.length if command == :R
    return (index - 1) % @map_directions.length if command == :L
  end
end
