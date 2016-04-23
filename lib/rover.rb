class Rover

  DIRECTIONS = [:N, :W, :S, :E]

  def initialize(x, y, direction, map: Map.new)
    @coordinates = {x: x, y: y}
    @direction = direction
    @map = map
  end

  def coordinates
    "#{@coordinates[:x]} #{@coordinates[:y]} #{@direction}"
  end

  def move
    target_coordinates
    update_coordinates if @map.movement_is_possible?(target_coordinates)
  end

  def turn(command)
    @direction = DIRECTIONS[determine_direction(command)]
  end

private

  def determine_direction(command)
    index = DIRECTIONS.find_index(@direction)
    return index + 1 if command == :R
    return index - 1 if command == :L
  end

  def update_coordinates
    @coordinates = target_coordinates
  end

   def target_coordinates
    target = @coordinates.dup
    case @direction
    when :N
      target[:y] = forward(:y)
    when :S
      target[:y] = back(:y)
    when :W
      target[:x] = forward(:x)
    else
      target[:x] = back(:x)
    end
    target
  end

  def forward(axis)
    @coordinates[axis].next
  end

  def back(axis)
    @coordinates[axis].pred
  end

end