class Rover

  def initialize(x, y, direction, map:)
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
    @direction = @map_directions[next_direction_index(command)]
  end

private

  def next_direction_index(command)
    return right_direction_index if command == :R
    return left_direction_index if command == :L
  end

  def right_direction_index
    (direction_index + 1) % @map_directions.length
  end

  def left_direction_index
    (direction_index - 1) % @map_directions.length
  end

  def direction_index
    @map_directions.find_index(@direction)
  end
end
