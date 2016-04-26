class Rover

  DIRECTIONS = [:N, :E, :S, :W]

  def initialize(x, y, direction, map: Map.new(width: width, height: height))
    @x = x
    @y = y
    @direction = direction
    @map = map
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
    @direction = DIRECTIONS[determine_direction(command)]
  end

private

  def determine_direction(command)
    index = DIRECTIONS.find_index(@direction)
    return (index + 1) % DIRECTIONS.length if command == :R
    return (index - 1) % DIRECTIONS.length if command == :L
  end
end
